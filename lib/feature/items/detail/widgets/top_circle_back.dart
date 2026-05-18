import 'package:deehelp/old_core/theme/size/icon_size.dart';
import 'package:flutter/material.dart';

class TopCircleBack extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const TopCircleBack({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.34),
      // color: Colors.white.withValues(alpha: 0.09),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          // width: 22,
          // height: 22,
          child: Icon(
            icon,
            color: Colors.white,
            size: IconSizes.sm,
          ),
        ),
      ),
    );
  }
}
