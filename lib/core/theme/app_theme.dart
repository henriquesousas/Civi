import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/text_button_theme.dart';
import 'package:flutter/material.dart';

import 'button_theme.dart';
import 'checkbox_theme.dart';
import 'input_decoration_theme.dart';
import 'theme_data.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    final baseColorScheme = const ColorScheme.light(
      secondaryContainer: Colors.white,
    );

    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      colorScheme: baseColorScheme,
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.blackColor40),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: AppColors.blackColor40),
      ),
      appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
    );
  }
}
