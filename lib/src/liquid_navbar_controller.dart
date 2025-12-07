import 'package:flutter/material.dart';

class LiquidNavbarController extends ChangeNotifier {
  int _currentIndex;
  double _dragOffset = 0.0;
  double _draggablePosition = 0.0;
  final PageController? pageController;

  LiquidNavbarController({
    int initialIndex = 0,
    this.pageController,
  }) : _currentIndex = initialIndex;

  int get currentIndex => _currentIndex;
  double get dragOffset => _dragOffset;
  double get draggablePosition => _draggablePosition;

  void setCurrentIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;

    // If we have a page controller, animate it
    if (pageController != null && pageController!.hasClients) {
      pageController!.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    notifyListeners();
  }

  void setDragOffset(double offset) {
    if (_dragOffset == offset) return;
    _dragOffset = offset;
    notifyListeners();
  }

  void setDraggablePosition(double position) {
    if (_draggablePosition == position) return;
    _draggablePosition = position;
    notifyListeners();
  }

  void resetDragOffset() {
    if (_dragOffset == 0.0) return;
    _dragOffset = 0.0;
    notifyListeners();
  }
}
