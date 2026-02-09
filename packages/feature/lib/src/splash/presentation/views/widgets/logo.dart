import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ImageSize.xl,
      height: ImageSize.xl,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(RadiusSize.xl),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 72.w,
          height: 72.h,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Icon(
            Icons.shield_outlined,
            color: Colors.white,
            size: IconSizes.xxxl,
          ),
        ),
      ),
    );
  }
}
