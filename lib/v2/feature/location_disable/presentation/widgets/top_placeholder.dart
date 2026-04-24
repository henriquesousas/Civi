import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopPlaceholder extends StatelessWidget {
  const TopPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF232323),
      child: Center(
        child: Container(
          width: SizeContainer.xxxl.w,
          height: SizeContainer.xxxl.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.10),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.08),
              width: 2,
            ),
          ),
          child: Center(
            child: Container(
              width: SizeContainer.m.w,
              height: SizeContainer.m.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF4EA3F7),
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
              ),
              child: Center(
                child: Text(
                  '?',
                  style: context.appText.title.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
