import 'package:deehelp/app/theme/app_colors_v2.dart';
import 'package:flutter/material.dart';

class UIIconRounded extends StatelessWidget {
  final String fileImage;
  final Color? color;
  const UIIconRounded({super.key, required this.fileImage, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Image(
          image: AssetImage(fileImage),
          color: color ?? AppColorsV2.buttonColor,
          width: 18,
        ),
      ),
    );
  }
}
