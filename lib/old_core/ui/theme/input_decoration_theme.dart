import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'constants.dart';

const InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  fillColor: AppColors.lightGreyColor30,
  filled: true,
  hintStyle: TextStyle(color: AppColors.greyColor),
  labelStyle: TextStyle(color: AppColors.greyColor),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

const InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  fillColor: AppColors.lightGreyColor,
  filled: true,
  hintStyle: TextStyle(color: AppColors.whileColor40),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);

const OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
  borderSide: BorderSide(color: AppColors.primaryColor),
);

const OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
  borderSide: BorderSide(
    color: AppColors.errorColor,
  ),
);

OutlineInputBorder secondaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
    borderSide: BorderSide(
      color:
          Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: 0.15),
    ),
  );
}
