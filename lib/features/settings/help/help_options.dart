import 'package:flutter/cupertino.dart';

class HelpOptions {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isAvailable;
  final String estimatedWait;

  const HelpOptions({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.isAvailable,
    required this.estimatedWait,
  });
}
