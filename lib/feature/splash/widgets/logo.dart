import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: context.isLandscape
      //     ? context.percentWidth(0.1)
      //     : context.percentWidth(0.6),
      // height: context.isLandscape
      //     ? context.percentHeight(0.2)
      //     : context.percentHeight(0.16),
      // width: 100.w,
      // height: 100.h,
      // width: 200,
      // height: 200,
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 2,
      ),
      // decoration: BoxDecoration(
      //   color: Colors.white.withValues(alpha: 0.14),
      //   borderRadius: BorderRadius.circular(100),
      //   border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/logo_kotto.png',
          // width: context.isLandscape
          //     ? context.percentWidth(0.2)
          //     : context.percentWidth(0.5),
          // height: context.isLandscape
          //     ? context.percentHeight(0.2)
          //     : context.percentHeight(0.1),
          width: 120.w,
          height: 120.h,
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
