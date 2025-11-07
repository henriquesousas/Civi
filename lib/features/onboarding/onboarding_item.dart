import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/resources/resources.dart';

class OnboardingItem {
  final String title;
  final String description;
  final IconData icon;
  final LinearGradient gradient;
  final String? lottieAsset;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.gradient,
    this.lottieAsset,
  });

  static List<OnboardingItem> pages() {
    return [
      OnboardingItem(
        title: R.strings.onboardingWelcomeHead,
        description: R.strings.onboardingWelcomeBody,
        icon: Icons.waving_hand_rounded,
        gradient: AppColors.primaryGradient,
        lottieAsset: null,
      ),
      OnboardingItem(
        title: R.strings.onboardingHelpHead,
        description: R.strings.onboardingHelpBody,
        icon: Icons.directions_car_rounded,
        gradient: AppColors.primaryGradient,
        lottieAsset: null,
      ),
      OnboardingItem(
        title: R.strings.onboardingAlertsRealTimeHead,
        description: R.strings.onboardingAlertsRealTimeBody,
        icon: Icons.location_on_rounded,
        gradient: AppColors.primaryGradient,
        lottieAsset: null,
      ),
      OnboardingItem(
        title: R.strings.onboardingSecurityHead,
        description: R.strings.onboardingSecurityBody,
        icon: Icons.security_rounded,
        gradient: AppColors.primaryGradient,
        lottieAsset: null,
      ),
    ];
  }
}
