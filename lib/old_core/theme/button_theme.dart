import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    // padding: const EdgeInsets.all(Dimens.defaultPadding),
    // backgroundColor: AppColors.primaryColor,
    minimumSize: const Size(double.infinity, 32),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(RadiusSize.md)),
    ),
  ).copyWith(
    textStyle: WidgetStatePropertyAll(
      TextStyle(fontWeight: FontWeight.w500, fontSize: AppTextSizes.button),
    ),
  ),
);

OutlinedButtonThemeData outlinedButtonTheme({
  Color? borderColor = AppColors.primaryColor,
  Color? bgColor,
}) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: bgColor,
      padding: const EdgeInsets.all(12),
      minimumSize: const Size(double.infinity, 32),
      side: BorderSide(width: 1, color: borderColor ?? AppColors.primaryColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}
