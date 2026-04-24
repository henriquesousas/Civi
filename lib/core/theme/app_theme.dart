// import 'package:app_core/app_core.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/text_button_theme.dart';
import 'package:flutter/material.dart';

import 'button_theme.dart';
import 'input_decoration_theme.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final baseColorScheme = const ColorScheme.light(
      primaryContainer: Color(0xFF2B5BEE),
      //CARDS
      surface: Colors.white, //background principal
      surfaceContainer: Colors.white, //background principal
      surfaceContainerLow: Color(0XFFF3F4F6), //background secundar
      // surfaceContainerLow: Color(0XFF000000), //background secundar
      // surfaceContainerHigh: Color(0XFFd6d6d6), //background accent
      surfaceContainerHigh: Color(0XFFd6d6d6), //background accent
      /// BORDAS
      // outline: Color(0xFFE4E8EF), //  borda principal
      // outline: Color(0xFFcdd0d7), //  borda principal
      outline: Color(0xFFe1e2e7), //  borda principal
      outlineVariant: Color(0xFFE4E8EF), // borda secundária
      // TEXTOS
      onSurface: Color(0xFF111827), // texto principal
      onSurfaceVariant: Color(0xFF6B7280), // texto secundário

      // Background principal
      // surface: Colors.white,
      // secondaryContainer: Colors.white,
      //Texto
      // texto principal
      // onSurface: const Color(0xFF1F2A44),
      // texto secundario
      // secondary: const Color(0xFF6B7AAE),
      // texto/icone/ propositalmente apagado
      surfaceDim: Color(0xFF475569),
      // texto error
      onError: Color(0xFFEA5B5B),
      // overlay de cor aplicado conforme a elevação
      surfaceTint: Color.fromARGB(0, 12, 15, 0),
      // bordas mais forte
      // outline: Color(0xFF475569),
      // outline → “borda principal”
      // outline: Colors.grey.shade100,
      // bordas mais fraca
      // outlineVariant: const Color(0xFFE6EAF6),
      // shadow
      shadow: Color(0x14000000),
      // usado pra modais (pode ser o mesmo)
      scrim: Colors.black,

      // surfaceContainer: Colors.white,
      // onSurfaceVariant: const Color(0xFF2B5BEE),
      // outlineVariant: Colors.grey.shade300,
      // outline: Colors.grey.shade800,

      primary: Color(0xFF2B5BEE),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Colors.white70,
    );

    return ThemeData(
      useMaterial3: true,
      // appBarTheme: appBarLightTheme,
      scaffoldBackgroundColor: const Color(0xFFF5F7FD),
      // scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      // scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      // fontFamily: "MuseoModerno",
      // fontFamily: "AlbertSans",
      // fontFamily: "Inter",
      // fontFamily: "Poppins",
      // fontFamily: "Roboto",
      colorScheme: baseColorScheme,
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryColorDark,
      // iconTheme: const IconThemeData(color: AppColors.blackColor),
      // textTheme: AppTypography.textTheme.apply(
      //   displayColor: baseColorScheme.onSurface,
      //   bodyColor: baseColorScheme.secondary,
      // ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // cor do texto e ícones
      ),
    );
  }

  static ThemeData dark() {
    final baseColorScheme = ColorScheme.dark(
      primaryContainer: const Color(0xFF2B5BEE),
      //CARDS
      surface: const Color(0xFF161616), //background base
      surfaceContainer: const Color(0xFF171717), //background principal
      surfaceContainerLow: const Color(0xFF252525), //background secundar
      // surfaceContainerLow: const Color(0xFF111111), //background secundar
      surfaceContainerHigh: const Color(0xFF2e2e2e),
      // TEXTOS
      onSurface: Colors.white, // texto principal
      onSurfaceVariant: Colors.white54, // texto secundário
      // Surface propositalmente apagado
      surfaceDim: const Color(0xFFB3B3B3), //Icone

      /// BORDAS
      outline: const Color(0xFF2A2A2A), //  borda principal
      outlineVariant: const Color(0xFF1d1d1d), // borda secundária

      //DELETE
      secondaryContainer: Colors.grey.withValues(alpha: 0.1),

      //Fundo para componentes (cards, listas) em diferentes níveis de elevação.

      // outline: Colors.grey.shade500,
      // primary: const Color(0xFF2B5BEE),
      primary: const Color(0xFF2B5BEE),
      onPrimary: const Color(0xFFFFFFFF),
      secondary: Colors.white70,
      onSecondary: const Color(0xFF2157F8),

      // primary: Color(0xFF0A84FF),
      // secondary: Color(0xFFFF9F0A),
    );

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black87,
      // scaffoldBackgroundColor: const Color(0xFF0B0E14),
      brightness: Brightness.dark,
      fontFamily: "Plus Jakarta",
      // fontFamily: "Poppins",
      // fontFamily: "Poppins",
      // fontFamily: "Roboto",
      colorScheme: baseColorScheme,
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryColorDark,
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white, // cor do texto e ícones
      ),
      // checkboxTheme: checkboxThemeData.copyWith(
      //   side: const BorderSide(color: AppColors.blackColor40),
      // ),
      // appBarTheme: appBarDarkTheme,
      // scrollbarTheme: scrollbarThemeData,
      // dataTableTheme: dataTableLightThemeData,
    );
  }
}
