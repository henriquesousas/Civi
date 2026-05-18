import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  ThemeColors get themeColor => ThemeColors(this);
}

class ThemeColors {
  final BuildContext _context;

  ThemeColors(this._context);
  //Cores remover
  Color get primaryColor => const Color(0xFF2B5BEE);
  Color get primaryColorDark => const Color(0xFF2651d6);
  //Background
  Color get primaryBgColor => Theme.of(_context).colorScheme.surface;
  Color get secundaryBgColor => Theme.of(_context).colorScheme.surfaceContainer;
  Color get secundaryBgColorHight =>
      Theme.of(_context).colorScheme.surfaceContainerHigh;
  Color get secundaryBgColorLow =>
      Theme.of(_context).colorScheme.surfaceContainerLow;
  //Texto
  //Texto
  Color get primaryTextColor => Theme.of(_context).colorScheme.onSurface;
  Color get secundaryTextColor =>
      Theme.of(_context).colorScheme.onSurfaceVariant;
  //Outline
  Color get outline => Theme.of(_context).colorScheme.outline;
  Color get outlineVariant => Theme.of(_context).colorScheme.outlineVariant;
  Color get surfaceVariant => Theme.of(_context).colorScheme.surfaceDim;
}
