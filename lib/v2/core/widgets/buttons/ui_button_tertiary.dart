import 'package:deehelp/old_core/extension/size_extension.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class UIButtonTertiary extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double? width;
  final double? height;
  const UIButtonTertiary({
    super.key,
    required this.text,
    required this.press,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.screenWidth,
      height: height ?? context.percentHeight(0.05),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFF1B2E46),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeRadius.xs),
            side: const BorderSide(
              color: Color(0xFF2E5E92),
              width: 1.5,
            ),
          ),
        ),
        child: Text(
          text,
          style: context.appText.subtitle.copyWith(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
