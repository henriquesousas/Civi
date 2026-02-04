import 'package:flutter/material.dart';

extension ThemeColorExtension on BuildContext {
  Color primaryColor() => Theme.of(this).primaryColor;
  Color primaryColorOpacity(double opacity) =>
      Theme.of(this).primaryColor.withValues(alpha: opacity);
}
