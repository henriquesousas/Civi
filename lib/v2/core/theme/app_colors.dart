import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  AppColors get appColor => AppColors(this);
}

class AppColors {
  final BuildContext _context;

  AppColors(this._context);
  //Cores
  Color get primaryColor => const Color(0xFF2B5BEE);
  Color get primaryColorDark => const Color(0xFF2651d6);
  //Cores dos temas
  Color get primaryBgColor => Theme.of(_context).colorScheme.surface;
  Color get primaryTextColor => Theme.of(_context).colorScheme.onSurface;
  Color get secundaryTextColor =>
      Theme.of(_context).colorScheme.onSurfaceVariant;
  Color get outline => Theme.of(_context).colorScheme.outline;
  Color get outlineVariant => Theme.of(_context).colorScheme.outlineVariant;
  Color get surfaceVariant => Theme.of(_context).colorScheme.surfaceDim;
}
