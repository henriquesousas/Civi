import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class TypeBadge extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color textColor;

  const TypeBadge({
    super.key,
    required this.label,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: context.appText.caption.copyWith(
          fontWeight: FontWeight.w700,
          color: textColor,
        ),

        // style: TextStyle(
        //   fontSize: 11.4,
        //   fontWeight: FontWeight.w700,
        //   color: textColor,
        // ),
      ),
    );
  }
}
