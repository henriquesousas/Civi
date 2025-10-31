import 'package:deehelp/shared/components/buttons/base_button.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class PrimaryButton extends BaseButton {
  const PrimaryButton({
    super.key,
    required super.text,
    required super.onPressed,
    super.width,
    super.isLoading,
    super.borderRadius,
    super.height,
    super.padding,
    super.backgroundColor,
  });

  @override
  Color getBackgroundColor() => super.backgroundColor ?? AppColors.primary;

  @override
  Color getForegroundColor() => Colors.white;
}
