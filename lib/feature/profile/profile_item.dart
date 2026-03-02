import 'package:flutter/material.dart';

class ProfileItem {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final String? badge;
  final bool isDestructive;
  final bool hideChevron;
  final VoidCallback? press;
  final bool isInstragram;

  const ProfileItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.badge,
    this.isDestructive = false,
    this.hideChevron = false,
    this.isInstragram = false,
    this.press,
  });
}
