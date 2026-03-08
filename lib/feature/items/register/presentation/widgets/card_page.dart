import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/size/radius_size.dart';
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
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.xl),
        border: BoxBorder.all(color: AppColors.grey.withValues(alpha: 0.3)),
        boxShadow: isFloating
            ? const [
                BoxShadow(
                  color: Color(0x1F2B5BEE),
                  blurRadius: 28,
                  spreadRadius: 1,
                  offset: Offset(0, 14),
                ),
              ]
            : const [
                BoxShadow(
                  color: Color(0x142B5BEE),
                  blurRadius: 16,
                  offset: Offset(0, 8),
                ),
              ],
      ),
      child: child,
    );
  }
}
