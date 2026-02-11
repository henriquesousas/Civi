import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class SectionQuickActions extends StatelessWidget {
  final String? actionText;
  final VoidCallback? onAction;

  const SectionQuickActions({
    super.key,
    required this.actionText,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "Ações rápidas",
        //   style: context.appText.body.copyWith(
        //     fontWeight: FontWeight.w700,
        //   ),
        // ),
        const CardGradient()
      ],
    );
  }
}
