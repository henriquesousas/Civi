import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

const Color _kPrimaryTextColor = Color(0xFF1E293B);

class AppTextStyles {
  final TextTheme _textTheme;

  AppTextStyles(this._textTheme);

  /// Estilo base para todos os textos. Define a família de fontes e fallback.
  TextStyle get _baseStyle {
    return const TextStyle(
      fontFamily: 'Plus Jakarta',
      // fontFamily: 'AlbertSans',
      fontFamilyFallback: ['sans-serif'],
    );
  }

  TextStyle get appBarTitle {
    // Tenta usar a cor 'onSurface' ou 'primary' do tema.
    final color = _textTheme.headlineSmall?.color ?? _kPrimaryTextColor;
    return _baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 25 / 20,
      letterSpacing: 0.38,
      color: color,
    );
  }

  TextStyle get bottomBar {
    final color = _textTheme.headlineSmall?.color ?? _kPrimaryTextColor;
    return _baseStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 25 / 20,
      letterSpacing: 0.38,
      color: color,
    );
  }

  TextStyle get sectionTitle3 {
    final color = _textTheme.titleMedium?.color ?? _kPrimaryTextColor;
    return _baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 20 / 15,
      letterSpacing: -0.5,
      color: AppColors.textColorHeader,
    );
  }

  TextStyle get sectionTitle {
    final color = _textTheme.titleMedium?.color ?? _kPrimaryTextColor;
    return _baseStyle.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 22 / 17,
      letterSpacing: -0.408,
      color: AppColors.textColorHeader,
    );
  }

  TextStyle get sectionSubTitle1 {
    final color = _textTheme.titleSmall?.color ?? _kPrimaryTextColor;
    return _baseStyle.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      height: 18 / 13,
      letterSpacing: -0.078,
      color: color,
    );
  }

  TextStyle get sectionBodyTextStyle {
    final color = _textTheme.titleSmall?.color ?? _kPrimaryTextColor;
    return _baseStyle.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 20 / 15,
        letterSpacing: -0.24,
        color: AppColors.textColorHeader);
  }

  TextStyle get caption1Style {
    final color = _textTheme.bodySmall?.color ?? _kPrimaryTextColor;
    return _baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 16 / 12,
      letterSpacing: 0,
      color: color,
    );
  }

  TextStyle get caption2Style {
    final color = _textTheme.labelSmall?.color ?? _kPrimaryTextColor;
    return _baseStyle.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      height: 13 / 11,
      letterSpacing: 0.06,
      color: color,
    );
  }

  TextStyle get bodyTextStyle1 {
    final color = _textTheme.bodyLarge?.color ?? Colors.white;
    return _baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 21 / 16,
      letterSpacing: -0.32,
      color: color,
    );
  }

  TextStyle bodyTextStyle2 = const TextStyle(
    fontFamily: 'AlbertSans',
    fontSize: 17,
    fontWeight: FontWeight.w400, // Bold
    height: 22 / 17,
    letterSpacing: -0.408,
    color: AppColors.textColorHeader,
    fontFamilyFallback: ['sans-serif'],
  );

  TextStyle get buttonTextStyle1 {
    final color = _textTheme.labelLarge?.color ?? Colors.white;
    return _baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 19.2 / 16,
      letterSpacing: 0,
      color: color,
    );
  }
}

extension BuildContextExtension on BuildContext {
  AppTextStyles get appTextStyles {
    final textTheme = Theme.of(this).textTheme;
    return AppTextStyles(textTheme);
  }
}
