import 'package:flutter/material.dart';
import 'responsiveness.dart';
import '../liquid_navbar.dart';
import 'liquid_navbar_controller.dart';

class NavbarWidget extends StatefulWidget {
  final List<Widget> icons;
  final List<String> labels;
  final double indicatorWidth;
  final double navbarHeight;
  final double bottomPadding;
  final double horizontalPadding;
  final Color selectedColor;
  final Color unselectedColor;
  final LiquidNavbarController? controller;
  final ValueChanged<int>? onItemSelected;

  const NavbarWidget({
    super.key,
    required this.icons,
    required this.labels,
    this.indicatorWidth = 70,
    this.navbarHeight = 70,
    this.bottomPadding = 20,
    this.horizontalPadding = 20,
    this.selectedColor = Colors.amber,
    this.unselectedColor = Colors.grey,
    this.controller,
    this.onItemSelected,
  });

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late LiquidNavbarController _controller;
  final List<GlobalKey> _iconKeys = [];
  final List<double> _positions = [];

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? LiquidNavbarController();
    _controller.addListener(_onControllerUpdate);

    // Initialize keys
    _iconKeys.addAll(List.generate(widget.icons.length, (_) => GlobalKey()));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measurePositions();
    });
  }

  @override
  void didUpdateWidget(NavbarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_onControllerUpdate);
      if (widget.controller != null) {
        _controller = widget.controller!;
        _controller.addListener(_onControllerUpdate);
      }
    }

    if (widget.icons.length != _iconKeys.length) {
      _iconKeys.clear();
      _iconKeys.addAll(List.generate(widget.icons.length, (_) => GlobalKey()));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _measurePositions();
      });
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose(); // Dispose local controller
    } else {
      _controller.removeListener(_onControllerUpdate);
    }
    super.dispose();
  }

  void _onControllerUpdate() {
    setState(() {});
  }

  void _measurePositions() {
    _positions.clear();
    for (var key in _iconKeys) {
      final box = key.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        final center = box.localToGlobal(Offset.zero).dx + box.size.width / 2;
        _positions.push(center);
      } else {
        _positions.push(0.0);
      }
    }

    if (_positions.isNotEmpty && _positions.length > _controller.currentIndex) {
      _controller.setDraggablePosition(_positions[_controller.currentIndex]);
    }
    setState(() {});
  }

  void _handleTap(int index) {
    _controller.setCurrentIndex(index);
    if (_positions.isNotEmpty && _positions.length > index) {
      _controller.setDraggablePosition(_positions[index]);
    }
    widget.onItemSelected?.call(index);
  }

  void _handleDragUpdate(double position) {
    _controller.setDraggablePosition(position);
  }

  void _handleDragEnd(int index) {
    _handleTap(index);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemCount = widget.icons.length;
    final currentIndex = _controller.currentIndex;
    final dragCenter = _controller.draggablePosition;

    return SizedBox(
      width: screenWidth,
      height: widget.navbarHeight.h + widget.bottomPadding.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // Background
          Positioned(
            left: 0,
            right: 0,
            bottom: widget.bottomPadding.h,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: widget.horizontalPadding.w),
              child: NavbarBackground(
                width: screenWidth,
                height: widget.navbarHeight.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(itemCount, (i) {
                    return NavbarItemWidget(
                      selectedColor: widget.selectedColor,
                      unselectedColor: widget.unselectedColor,
                      key: _iconKeys[i],
                      icon: widget.icons[i],
                      label: widget.labels[i],
                      isSelected: i == currentIndex,
                      onTap: () => _handleTap(i),
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                    );
                  }),
                ),
              ),
            ),
          ),

          // Draggable indicator
          if (_positions.isNotEmpty)
            NavbarDraggableIndicator(
              position: dragCenter,
              baseSize: widget.indicatorWidth,
              itemCount: itemCount,
              snapPositions: _positions,
              onDragUpdate: _handleDragUpdate,
              onDragEnd: _handleDragEnd,
              bottomOffset: widget.bottomPadding.h,
            ),
        ],
      ),
    );
  }
}

extension on List<double> {
  void push(double value) => add(value);
}
