import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isLandscape
          ? context.percentWidth(0.2)
          : context.percentWidth(0.35),
      height: context.isLandscape
          ? context.percentHeight(0.4)
          : context.percentHeight(0.16),
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(RadiusSize.xl),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          'assets/images/logo.png',
          // width: context.percentWidth(0.1),
          // height: context.percentWidth(0.13),
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(
            Icons.shield_outlined,
            color: Colors.white,
            size: context.isLandscape
                ? context.percentWidth(0.1)
                : context.percentWidth(0.2),
          ),
        ),
      ),
    );
  }
}
