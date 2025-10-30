import 'package:deehelp/shared/components/buttons/base_button.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class SecondaryButton extends BaseButton {
  const SecondaryButton({
    super.key,
    required super.text,
    required super.onPressed,
    super.height,
    super.textStyle,
  });

  @override
  Color getBackgroundColor() => Colors.white;

  @override
  Color getForegroundColor() => AppColors.primary;
}
