import 'package:flutter/material.dart';

extension ThemeColorExtension on BuildContext {
  Color primaryColor() => Theme.of(this).primaryColor;
  Color primaryColorOpacity(double opacity) =>
      Theme.of(this).primaryColor.withValues(alpha: opacity);

  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get outlineVariantColor => Theme.of(this).colorScheme.outlineVariant;
  Color get shadowColor =>
      Theme.of(this).colorScheme.shadow.withValues(alpha: 0.1);
}
