import 'package:flutter/material.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class ProgressIndicatorLabel extends StatelessWidget {
  final String label;
  final bool isActive;
  const ProgressIndicatorLabel({
    super.key,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context.getTextStyle.small.copyWith(
        color: isActive ? AppColors.primary : AppColors.textSecondary,
        fontWeight: isActive ? FontWeight.bold : FontWeight.w300,
        // fontSize: context.responsiveText(0.03),
      ),
    );
  }
}
