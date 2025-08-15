import 'package:flutter/material.dart';

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
}
