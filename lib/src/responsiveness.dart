/// A compatibility layer to replace flutter_screenutil.
/// This simply returns the double value as is (logical pixels).
extension NumResponsiveness on num {
  /// Width (just returns the value)
  double get w => toDouble();

  /// Height (just returns the value)
  double get h => toDouble();

  /// Font size (just returns the value)
  double get sp => toDouble();

  /// Radius (just returns the value)
  double get r => toDouble();

  /// Screen Width (just returns the value)
  /// Note: .sw generally expects a fraction of screen width (e.g. 0.5.sw),
  /// but without context we cannot know the screen width.
  /// You should replace usage of .sw with MediaQuery.of(context).size.width * value
  double get sw => toDouble();

  /// Screen Height (just returns the value)
  /// Note: .sh generally expects a fraction of screen height.
  /// You should replace usage of .sh with MediaQuery.of(context).size.height * value
  double get sh => toDouble();
}
