import 'package:flutter/material.dart';
import 'liquid_navbar_controller.dart';
import 'navbar_widget.dart';

class BottomNavScaffold extends StatefulWidget {
  final List<Widget> pages;
  final List<Widget> icons;
  final List<String> labels;

  // Optional styling
  final double navbarHeight;
  final double indicatorWidth;
  final double bottomPadding;
  final Color selectedColor;
  final Color unselectedColor;
  final double horizontalPadding;
  final LiquidNavbarController? controller;

  const BottomNavScaffold({
    super.key,
    required this.pages,
    required this.icons,
    required this.labels,
    this.navbarHeight = 70,
    this.indicatorWidth = 70,
    this.bottomPadding = 20,
    this.selectedColor = Colors.amber,
    this.unselectedColor = Colors.grey,
    this.horizontalPadding = 10,
    this.controller,
  });

  @override
  State<BottomNavScaffold> createState() => _BottomNavScaffoldState();
}

class _BottomNavScaffoldState extends State<BottomNavScaffold> {
  late LiquidNavbarController _controller;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = widget.controller ??
        LiquidNavbarController(pageController: _pageController);

    // If controller was provided but didn't have the page controller attached (because it was created outside),
    // we can't easily Attach it unless we added a setter.
    // Ideally, if user provides controller, they should handle page control or we sync differently.
    // For now, let's assume if they pass a controller, we just listen to it.
    // But wait, the previous logic had a single source of truth.
    // If I create the controller here, I pass the pageController.
    // If user passes controller, I should arguably check if I can sync.
    // Let's stick to the pattern: We listen to controller.

    _controller.addListener(_onControllerUpdate);
  }

  @override
  void didUpdateWidget(BottomNavScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_onControllerUpdate);
      if (widget.controller != null) {
        _controller = widget.controller!;
        _controller.addListener(_onControllerUpdate);
      }
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onControllerUpdate);
    }
    _pageController.dispose();
    super.dispose();
  }

  void _onControllerUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _controller.currentIndex;
    final dragOffset = _controller.dragOffset;

    return Scaffold(
      body: Stack(
        children: [
          // PageView with parallax
          Transform.translate(
            offset: Offset(dragOffset * 0.25, 0),
            child: PageView(
              controller: _pageController, // Use local page controller
              physics: const NeverScrollableScrollPhysics(),
              children: widget.pages,
            ),
          ),

          // Floating navbar with draggable
          Positioned(
            bottom: widget.bottomPadding,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragUpdate: (details) {
                  _controller
                      .setDragOffset(dragOffset + details.delta.dx * 0.3);
                },
                onHorizontalDragEnd: (_) {
                  const threshold = 80;

                  if (dragOffset.abs() > threshold) {
                    final jump = -(dragOffset / threshold).round();
                    final newIndex = (currentIndex + jump).clamp(
                      0,
                      widget.pages.length - 1,
                    );
                    if (newIndex != currentIndex) {
                      _controller.setCurrentIndex(newIndex);
                    }
                  }

                  _controller.resetDragOffset();
                },
                child: NavbarWidget(
                  icons: widget.icons,
                  labels: widget.labels,
                  selectedColor: widget.selectedColor,
                  unselectedColor: widget.unselectedColor,
                  indicatorWidth: widget.indicatorWidth,
                  navbarHeight: widget.navbarHeight,
                  bottomPadding: widget.bottomPadding,
                  horizontalPadding: widget.horizontalPadding,
                  controller: _controller, // Share the controller
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
