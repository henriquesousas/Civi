import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  // fillColor: AppColors.lightGreyColor30,
  filled: true,
  hintStyle: const TextStyle(color: Colors.grey),
  // labelStyle: TextStyle(color: AppColors.greyColor),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  // fillColor: AppColors.lightGreyColor,
  filled: true,
  hintStyle: const TextStyle(color: Colors.white38),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);

OutlineInputBorder focusedOutlineInputBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: AppColors.primaryColor),
);

OutlineInputBorder errorOutlineInputBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(
    color: AppColors.danger,
  ),
);

OutlineInputBorder secondaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(
      color:
          Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: 0.15),
    ),
  );
}
