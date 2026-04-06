import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingResultsSkeleton extends StatelessWidget {
  final int size;
  const LoadingResultsSkeleton({super.key, this.size = 10});

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

class LoadingResultsSkeletonV2 extends StatelessWidget {
  const LoadingResultsSkeletonV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            // const SizedBox(height: 12),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Color(0xFF050505),
                    color: context.surfaceColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x142B5BEE),
                        blurRadius: 30,
                        offset: Offset(0, -8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: 5,
                          separatorBuilder: (_, __) => Divider(
                            // color: Color(0xFF1C1C1E),
                            color: context.outlineVariantColor,
                            height: 1,
                          ),
                          itemBuilder: (_, __) =>
                              const OffenderListTileShimmer(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const _BottomNavBarShimmer(),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const _ShimmerBox({
    required this.width,
    required this.height,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _ShimmerCircle extends StatelessWidget {
  final double size;

  const _ShimmerCircle({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}

class OffenderListTileShimmer extends StatelessWidget {
  const OffenderListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
      child: Shimmer.fromColors(
        // baseColor: const Color(0xFF151517),
        // highlightColor: const Color(0xFF242428),
        baseColor: context.outline,
        highlightColor: context.outlineVariantColor,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _ShimmerBox(
                          width: 150,
                          height: 13,
                          radius: 6,
                        ),
                        SizedBox(width: 8),
                        _ShimmerCircle(size: 19),
                      ],
                    ),
                    SizedBox(height: 14),
                    _ShimmerBox(
                      width: 220,
                      height: 30,
                      radius: 8,
                    ),
                    SizedBox(height: 10),
                    _ShimmerBox(
                      width: 210,
                      height: 15,
                      radius: 6,
                    ),
                    SizedBox(height: 8),
                    _ShimmerBox(
                      width: 170,
                      height: 15,
                      radius: 6,
                    ),
                    SizedBox(height: 20),
                    _ShimmerBox(
                      width: 110,
                      height: 30,
                      radius: 100,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                _ShimmerBox(
                  width: 128,
                  height: 146,
                  radius: 28,
                ),
                // SizedBox(height: 18),
                // Row(
                //   children: [
                //     // _ShimmerCircle(size: 18),
                //     // SizedBox(width: 8),
                //     // _ShimmerBox(
                //     //   width: 42,
                //     //   height: 14,
                //     //   radius: 6,
                //     // ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
