import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenSizeExtension on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double get pixelDensity => MediaQuery.of(this).devicePixelRatio;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get hasSafeArea => topPadding > 0 || bottomPadding > 0;

  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;

  double safeSp(double value) {
    final isLandscape =
        MediaQuery.of(this).orientation == Orientation.landscape;
    final v = value.sp;
    return isLandscape ? v.clamp(10.0, 18.0) : v;
  }
}
