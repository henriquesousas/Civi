import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get surfaceDim => Theme.of(this).colorScheme.surfaceDim;
  Color get outlineVariantColor => Theme.of(this).colorScheme.outlineVariant;
  Color get outline => Theme.of(this).colorScheme.outline;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;
  Color get onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;
  Color get shadowColor =>
      Theme.of(this).colorScheme.shadow.withValues(alpha: 0.1);
}
