import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  //Cards
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get primaryBgCard => Theme.of(this).colorScheme.surfaceContainer;
  Color get primaryBgCardLow => Theme.of(this).colorScheme.surfaceContainerLow;
  Color get primaryBgCardHigh =>
      Theme.of(this).colorScheme.surfaceContainerHigh;

  //Textos
  Color get primaryTextColor => Theme.of(this).colorScheme.onSurface;
  Color get secondaryTextColor => Theme.of(this).colorScheme.onSurfaceVariant;

  //Bordas
  Color get outline => Theme.of(this).colorScheme.outline; //Borda principal
  Color get outlineVariantColor =>
      Theme.of(this).colorScheme.outlineVariant; //Borda secundária

  //Deletar
  Color get onSurface => Theme.of(this).colorScheme.onSurface;
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get surfaceDim => Theme.of(this).colorScheme.surfaceDim;

  Color get onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;
  Color get shadowColor =>
      Theme.of(this).colorScheme.shadow.withValues(alpha: 0.1);
}
