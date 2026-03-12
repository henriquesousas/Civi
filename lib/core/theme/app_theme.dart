// import 'package:app_core/app_core.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/text_button_theme.dart';
import 'package:flutter/material.dart';

import 'button_theme.dart';
import 'input_decoration_theme.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final baseColorScheme = ColorScheme.light(
      primaryContainer: Color(0xFF2B5BEE),
      // Bg principal
      surface: Colors.white,
      secondaryContainer: Colors.white,
      //Texto
      // texto principal
      onSurface: const Color(0xFF1F2A44),
      // texto secundario
      secondary: const Color(0xFF6B7AAE),
      // texto/icone/ propositalmente apagado
      surfaceDim: const Color(0xFF475569),
      // texto error
      onError: const Color(0xFFEA5B5B),
      // overlay de cor aplicado conforme a elevação
      surfaceTint: const Color.fromARGB(0, 12, 15, 0),
      // bordas mais forte
      // outline: Color(0xFF475569),
      // outline → “borda principal”
      outline: Colors.grey.shade100,
      // bordas mais fraca
      outlineVariant: const Color(0xFFE6EAF6),
      // shadow
      shadow: const Color(0x14000000),
      // usado pra modais (pode ser o mesmo)
      scrim: Colors.black,

      // surfaceContainer: Colors.white,
      // surfaceVariant: Color(0xFF6B7AAE),

      // outlineVariant: Colors.grey.shade300,
      // outline: Colors.grey.shade800,

      primary: Color(0xFF2B5BEE),
      onPrimary: Color(0xFFFFFFFF),
    );

    return ThemeData(
      useMaterial3: true,
      // appBarTheme: appBarLightTheme,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      colorScheme: baseColorScheme,
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColor: AppColors.primaryColor,
      // iconTheme: const IconThemeData(color: AppColors.blackColor),
      // textTheme: AppTypography.textTheme.apply(
      //   displayColor: baseColorScheme.onSurface,
      //   bodyColor: baseColorScheme.secondary,
      // ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      // checkboxTheme: checkboxThemeData.copyWith(
      //   side: const BorderSide(color: AppColors.blackColor40),
      // ),
      // scrollbarTheme: scrollbarThemeData,
      // dataTableTheme: dataTableLightThemeData,
    );
  }

  static ThemeData dark() {
    final baseColorScheme = ColorScheme.light(
      primaryContainer: const Color(0xFF1f222a),
      surface: const Color(0xFF1f222a), // Fundo principal
      secondaryContainer:
          Colors.grey.withValues(alpha: 0.1), //Color(0xFF1f222a),

      onSurface: Colors.white, // Texto principal
      // texto/icone/ propositalmente apagado
      surfaceDim: Colors.grey.shade700,
      //Fundo para componentes (cards, listas) em diferentes níveis de elevação.
      surfaceContainer: const Color(0xFF1f222a),
      // outlineVariant versão mais suave, usada em bordas
      outlineVariant: Colors.grey.shade800,
      // outline → “borda principal”
      outline: Colors.grey.shade900,

      // outline: Colors.grey.shade500,
      primary: const Color(0xFF2B5BEE),
      onSecondary: const Color(0xFF2157F8),
      secondary: Colors.white70,

      // primary: Color(0xFF0A84FF),
      // secondary: Color(0xFFFF9F0A),
    );

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black87,
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      colorScheme: baseColorScheme,
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColor: AppColors.primaryColor,
      // iconTheme: const IconThemeData(color: AppColors.blackColor),
      // textTheme: const TextTheme(
      //   bodyMedium: TextStyle(color: AppColors.blackColor40),
      // ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      // checkboxTheme: checkboxThemeData.copyWith(
      //   side: const BorderSide(color: AppColors.blackColor40),
      // ),
      // appBarTheme: appBarDarkTheme,
      // scrollbarTheme: scrollbarThemeData,
      // dataTableTheme: dataTableLightThemeData,
    );
  }
}
