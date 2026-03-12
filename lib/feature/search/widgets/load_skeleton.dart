import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingResultsSkeleton extends StatelessWidget {
  final int size;
  const LoadingResultsSkeleton({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          size,
          (i) => Container(
            margin: const EdgeInsets.only(top: 10),
            height: 96.h,
            decoration: BoxDecoration(
              // color: Colors.white,
              color: context.surfaceColor,
              borderRadius: BorderRadius.circular(RadiusSize.xl),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x142B5BEE),
                  blurRadius: 16,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      // color: const Color(0xFFF5F7FD),
                      color: context.surfaceColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        // color: const Color(0xFFE6EAF6),
                        color:
                            context.outlineVariantColor.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                  const SizedBox(width: RadiusSize.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 14.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: const Color(0xFFF5F7FD),
                            color: context.outlineVariantColor
                                .withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 12.h,
                          width: 220.w,
                          decoration: BoxDecoration(
                            color: context.outlineVariantColor
                                .withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 12.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: context.outlineVariantColor
                                .withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
