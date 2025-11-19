import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class UISimpleContainer extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback? press;
  final EdgeInsets? padding;
  const UISimpleContainer({
    super.key,
    required this.children,
    this.press,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: padding ?? const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: BoxBorder.all(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withValues(alpha: 0.1),
          //     offset: const Offset(0, 1),
          //     blurRadius: 5,
          //     spreadRadius: 0,
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...children,
          ],
        ),
      ),
    );
  }
}
