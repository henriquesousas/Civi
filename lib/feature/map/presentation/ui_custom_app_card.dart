import 'package:flutter/material.dart';

class UICustomAppCard extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double radius;
  final VoidCallback? onPressed;
  final Widget child;
  final BoxBorder? boxBorder;
  final bool showBorder;
  final bool showShadow;

  const UICustomAppCard({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    // this.borderColor = const Color(0xFFE2E8F0),
    this.borderColor,
    this.borderWidth = 1,
    this.radius = 20,
    this.onPressed,
    required this.child,
    this.padding,
    this.margin,
    this.boxBorder,
    this.showBorder = true,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.all(16),
        margin: margin,
        decoration: BoxDecoration(
          color:
              backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder
              ? boxBorder ??
                  Border.all(
                      color: borderColor ??
                          Theme.of(context).colorScheme.outlineVariant,
                      width: borderWidth)
              : null,
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: child,
      ),
    );
  }
}
