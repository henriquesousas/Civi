import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingTag extends StatelessWidget {
  final String text;
  final double lineHeight;
  final bool lineToRight;

  const FloatingTag({
    super.key,
    required this.text,
    required this.lineHeight,
    this.lineToRight = false,
  });

  @override
  Widget build(BuildContext context) {
    final lineColor = Colors.white.withValues(alpha: 0.90);

    return Column(
      crossAxisAlignment:
          lineToRight ? CrossAxisAlignment.end : CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeLayoutSpacing.m,
            vertical: SizeLayoutSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(SizeRadius.m),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.22),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Text(
            text,
            style: context.appText.caption.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
        if (!lineToRight) ...[
          Container(width: 2, height: lineHeight, color: lineColor),
          Container(
            width: 14.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: lineColor,
              shape: BoxShape.circle,
            ),
          ),
        ] else ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 2.w, height: lineHeight, color: lineColor),
              Container(width: 42.h, height: 2, color: lineColor),
              Container(
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: lineColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
