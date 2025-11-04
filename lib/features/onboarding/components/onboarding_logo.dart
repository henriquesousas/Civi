import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

class OnboardingLogo extends StatelessWidget {
  // final IconData icon;
  final Icon icon;
  final Color? circleInsideColor;
  final Color? circleOutsideColor;
  const OnboardingLogo({
    super.key,
    required this.icon,
    this.circleInsideColor,
    this.circleOutsideColor,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.percentWidth(0.5);
    final height = context.percentWidth(0.5);
    final radius = context.responsiveRadius(0.6);
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: circleOutsideColor ?? Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.6),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                color: circleInsideColor ?? Colors.white,
                borderRadius: BorderRadius.circular(radius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: const Offset(0, 10),
                    blurRadius: 30,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
