import 'package:flutter/material.dart';

class PageCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool isFloating;
  final Color? bgColor;
  const PageCard({
    super.key,
    required this.child,
    this.padding,
    this.bgColor,
    this.isFloating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      // decoration: BoxDecoration(
      //   // color: bgColor ?? Colors.white,
      //   color: bgColor ?? context.surfaceColor,
      //   borderRadius: BorderRadius.circular(RadiusSize.xl),
      //   // border: BoxBorder.all(color: AppColors.grey.withValues(alpha: 0.3)),
      //   border: BoxBorder.all(
      //       color: context.outlineVariantColor.withValues(alpha: 0.5)),
      //   boxShadow: isFloating
      //       ? const [
      //           BoxShadow(
      //             color: Color(0x1F2B5BEE),
      //             blurRadius: 28,
      //             spreadRadius: 1,
      //             offset: Offset(0, 14),
      //           ),
      //         ]
      //       : const [
      //           BoxShadow(
      //             color: Color(0x142B5BEE),
      //             blurRadius: 16,
      //             offset: Offset(0, 8),
      //           ),
      //         ],
      // ),
      decoration: BoxDecoration(
        // color: const Color(0xFF101012),
        // color: const Color(0xFF121821),
        // color: const Color(0xFF0B0F1A),
        color: const Color(0xFF101012),
        borderRadius: BorderRadius.circular(24),
        // border: Border.all(color: const Color(0xFF1D1D21)),
        // border: Border.all(color: const Color(0xFF222B38)),
        border: Border.all(color: const Color(0xFF1D1D21)),
      ),
      child: child,
    );
  }
}
