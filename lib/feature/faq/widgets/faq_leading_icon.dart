import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadingIcon extends StatelessWidget {
  final Color color;
  final bool expanded;

  const LeadingIcon({super.key, required this.color, required this.expanded});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color:
            expanded ? color.withValues(alpha: 0.14) : const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: expanded
              ? color.withValues(alpha: 0.30)
              : const Color(0xFFE6EAF6),
        ),
      ),
      child: Icon(
        expanded ? Icons.question_answer_outlined : Icons.help_outline,
        color: expanded ? color : const Color(0xFF1F2A44),
        size: IconSizes.md,
      ),
    );
  }
}
