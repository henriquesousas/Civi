import '../../extension/size_extension.dart';
import '../../theme/size/app_text_size.dart';
import 'package:flutter/material.dart';

extension AppTexteExtension on BuildContext {
  AppTextStyles get appText => AppTextStyles(this);
}

class AppTextStyles {
  final BuildContext _context;
  const AppTextStyles(this._context);

  TextTheme get _textTheme => Theme.of(_context).textTheme;
  ColorScheme get _colorScheme => Theme.of(_context).colorScheme;

  //Header
  TextStyle get headersm => _textTheme.titleMedium!
      .copyWith(fontWeight: FontWeight.w900, fontSize: AppTextSizes.headersm);

  TextStyle get headermd => headersm.copyWith(fontSize: AppTextSizes.headermd);

  TextStyle get headerlg => headersm.copyWith(fontSize: AppTextSizes.headerlg);

  TextStyle get headerxl => headersm.copyWith(fontSize: AppTextSizes.headerxg);

  // Body
  TextStyle get body => _textTheme.bodyMedium!.copyWith(
        fontSize: _context.safeSp(AppTextSizes.body),
      );

  TextStyle get bodymd => _textTheme.bodyMedium!.copyWith(
        fontSize: _context.safeSp(AppTextSizes.bodymd),
      );

  TextStyle get bodySmall => _textTheme.bodySmall!.copyWith(
        fontSize: _context.safeSp(AppTextSizes.bodySmall),
        fontWeight: FontWeight.w500,
        color: _colorScheme.onSurface,
      );

  TextStyle get title => _textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: _context.safeSp(AppTextSizes.headerlg),
      );

  TextStyle get titleMedium => _textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: _context.safeSp(AppTextSizes.headermd),
      );

  TextStyle get label => _textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _context.safeSp(AppTextSizes.label),
      );

  TextStyle get caption => _textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: _context.safeSp(AppTextSizes.caption),
      );

  // Button
  TextStyle get button => headersm.copyWith(
        fontSize: _context.safeSp(AppTextSizes.button),
      );
}
