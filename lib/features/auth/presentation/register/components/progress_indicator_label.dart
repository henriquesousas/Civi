import 'package:flutter/material.dart';

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
      // style: context.getTextStyle.small.copyWith(
      //   color: isActive ? AppColorsV2.primary : AppColorsV2.textSecondary,
      //   fontWeight: isActive ? FontWeight.bold : FontWeight.w300,
      //   // fontSize: context.responsiveText(0.03),
      // ),
    );
  }
}
