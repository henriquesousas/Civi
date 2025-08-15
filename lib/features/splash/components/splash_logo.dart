import 'package:flutter/material.dart';
import 'package:yousafe/app/theme/app_colors.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: const Offset(0, 10),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.directions_car_rounded,
          size: 60,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
