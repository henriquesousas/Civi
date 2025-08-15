import 'package:flutter/material.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';

class OnboardingLogo extends StatelessWidget {
  final IconData icon;
  const OnboardingLogo({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.percentWidth(0.5),
        height: context.percentHeight(0.23),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(300),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.3),
            width: 2,
          ),
        ),
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  offset: const Offset(0, 10),
                  blurRadius: 30,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 60,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
