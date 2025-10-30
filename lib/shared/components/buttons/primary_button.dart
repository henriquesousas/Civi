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
  });

  @override
  Color getBackgroundColor() => AppColors.primary;

  @override
  Color getForegroundColor() => Colors.white;
}
