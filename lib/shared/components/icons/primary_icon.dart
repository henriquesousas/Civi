import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class PrimaryIcon extends StatelessWidget {
  final Icon icon;
  final double? borderRadius;
  final double? width;
  final double? height;
  final LinearGradient? background;
  const PrimaryIcon(
      {super.key,
      required this.icon,
      this.borderRadius,
      this.width,
      this.height,
      this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 60,
      height: height ?? 60,
      decoration: BoxDecoration(
        gradient: background ?? AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            offset: const Offset(0, 8),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      child: icon,
    );
  }
}
