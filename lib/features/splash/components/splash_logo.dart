import 'package:deehelp/app/theme/app_colors_v2.dart';
import 'package:flutter/material.dart';

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
      child: const Center(
        child: Icon(
          Icons.directions_car_rounded,
          size: 60,
          color: AppColorsV2.primary,
        ),
      ),
    );
  }
}
