import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;
  double responsiveText(double scale) => screenWidth * scale;
  double get pixelDensity => MediaQuery.of(this).devicePixelRatio;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;

  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get hasSafeArea => topPadding > 0 || bottomPadding > 0;

  Orientation get orientation => MediaQuery.of(this).orientation;
}
