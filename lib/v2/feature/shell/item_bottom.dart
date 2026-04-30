import 'package:flutter/cupertino.dart';

class ItemBottom {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isCenter;

  const ItemBottom({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.isCenter = false,
  });
}
