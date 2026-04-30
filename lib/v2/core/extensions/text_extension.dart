import 'package:flutter/material.dart';

extension AppTexteExtension on BuildContext {
  AppTextStyles get appText => AppTextStyles(this);
}

class AppTextStyles {
  final BuildContext _context;
  const AppTextStyles(this._context);
  TextTheme get _textTheme => Theme.of(_context).textTheme;

  TextStyle get header => _textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  // TextStyle get header2 => _textTheme.headlineSmall!.copyWith(
  //       fontWeight: FontWeight.w500,
  //     );
  TextStyle get title => _textTheme.titleLarge!;
  TextStyle get bodyLarger => _textTheme.bodyLarge!;
  TextStyle get subtitle => _textTheme.bodyMedium!;
  TextStyle get caption => _textTheme.bodySmall!;
  TextStyle get button => _textTheme.labelLarge!;
}
