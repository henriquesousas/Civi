import 'package:flutter/material.dart';

class WelcomeFeature {
  final IconData icon;
  final String title;
  final String description;
  final LinearGradient gradient;
  final String actionText;

  const WelcomeFeature({
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
    required this.actionText,
  });
}
