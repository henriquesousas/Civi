import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:flutter/material.dart';

class HomeAvatarBadge extends StatelessWidget {
  final String initials;
  final VoidCallback onTap;
  const HomeAvatarBadge(
      {super.key, required this.initials, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: context.primaryColor.withOpacity(0.12),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          initials,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: context.primaryColor,
          ),
        ),
      ),
    );
  }
}
