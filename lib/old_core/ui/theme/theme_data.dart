import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'constants.dart';

const AppBarTheme appBarLightTheme = AppBarTheme(
  surfaceTintColor: Colors.transparent,
  // scrolledUnderElevation: 4.0,
  elevation: 1.0,
  shadowColor: Colors.white70,
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: AppColors.blackColor),
);

const AppBarTheme appBarDarkTheme = AppBarTheme(
  backgroundColor: Colors.black12,
  scrolledUnderElevation: 8.0,
  elevation: 8.0,
  surfaceTintColor: Colors.transparent,
  iconTheme: IconThemeData(color: Colors.white),
);

ScrollbarThemeData scrollbarThemeData = ScrollbarThemeData(
  trackColor: MaterialStateProperty.all(AppColors.primaryColor),
);

DataTableThemeData dataTableLightThemeData = DataTableThemeData(
  columnSpacing: 24,
  headingRowColor: MaterialStateProperty.all(Colors.black12),
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
    border: Border.all(color: Colors.black12),
  ),
  dataTextStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  ),
);

DataTableThemeData dataTableDarkThemeData = DataTableThemeData(
  columnSpacing: 24,
  headingRowColor: MaterialStateProperty.all(Colors.white10),
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
    border: Border.all(color: Colors.white10),
  ),
  dataTextStyle: const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 12,
  ),
);
