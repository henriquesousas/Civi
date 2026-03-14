import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class SurfaceCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Border? border;

  const SurfaceCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.border,
  });

  static const shadow = BoxShadow(
    color: Color(0x12000000),
    blurRadius: 18,
    offset: Offset(0, 10),
  );

  static const shadowSoft = BoxShadow(
    color: Color(0x0D000000),
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: LayoutSpacingSize.card,
            vertical: LayoutSpacingSize.card,
          ),
      // decoration: BoxDecoration(
      //   color: context.surfaceColor,
      //   borderRadius: BorderRadius.circular(RadiusSize.lg),
      //   border: border ??
      //       Border.all(
      //         color: context.outlineVariantColor,
      //         width: 1,
      //       ),
      //   boxShadow: const [shadowSoft],
      // ),
      decoration: BoxDecoration(
        color: const Color(0xFF101012),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1D1D21)),
      ),
      child: child,
    );

    if (onTap == null) return card;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: card,
    );
  }
}
