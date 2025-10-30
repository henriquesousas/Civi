import 'package:deehelp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeLight() {
    return ThemeData(
      fontFamily: "Poppins",
      useMaterial3: false,
      brightness: Brightness.light,
      // textTheme: const TextTheme(
      //   bodySmall: AppTextStyles.bodySmall,
      //   bodyMedium: AppTextStyles.bodyMedium,
      //   bodyLarge: AppTextStyles.bodyLarge,
      //   headlineSmall: AppTextStyles.headlineSmall,
      //   headlineMedium: AppTextStyles.headlineMedium,
      //   headlineLarge: AppTextStyles.headlineLarge,
      // ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      colorScheme: const ColorScheme(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.primaryColor,
        error: AppColors.redColor,
        onError: AppColors.redColor,
        surface: AppColors.containerBackgroundColor,
        onSurface: AppColors.primaryColor,
        brightness: Brightness.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackgroundColor,
          foregroundColor: AppColors.buttonTextColor,
          elevation: 0,
          disabledBackgroundColor:
              AppColors.buttonDisableColor.withValues(alpha: 0.5),
          // textStyle: AppTextStyles.button,
        ),
      ),
    );
  }
}
