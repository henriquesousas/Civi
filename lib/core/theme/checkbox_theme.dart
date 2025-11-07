import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'constants.dart';

CheckboxThemeData checkboxThemeData = CheckboxThemeData(
  checkColor: MaterialStateProperty.all(Colors.white),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(defaultBorderRadius / 2),
    ),
  ),
  side: const BorderSide(color: AppColors.whileColor40),
);
