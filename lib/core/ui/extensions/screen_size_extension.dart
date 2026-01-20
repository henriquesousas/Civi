import 'package:flutter/material.dart';

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

  //TODO: Remover
  double responsiveText(double scale) => screenWidth * scale;
  double responsiveRadius(double scale) => screenWidth * scale;

  Size designSize() {
    final size = MediaQuery.of(this).size;
    if (size.width > 900) {
      // **Tablets or Large Screens**
      return orientation == Orientation.landscape
          ? const Size(1400, 900)
          : const Size(900, 1400);
    } else if (size.width > 600) {
      // **Medium-sized tablets**
      return orientation == Orientation.landscape
          ? const Size(1200, 800)
          : const Size(800, 1200);
    } else if (size.width > 430) {
      // **Big Phones like Galaxy S24 Ultra, iPhone 15 Pro Max**
      return orientation == Orientation.landscape
          ? const Size(1000, 450) // Adjust for landscape
          : const Size(450, 1000); // Adjust for portrait
    } else {
      // **Default mobile phones**
      return orientation == Orientation.landscape
          ? const Size(812, 375)
          : const Size(375, 812);
    }
  }
}
