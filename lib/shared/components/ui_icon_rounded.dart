import 'package:flutter/material.dart';
import 'package:deehelp/app/theme/app_colors.dart';

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
          color: color ?? AppColors.buttonColor,
          width: 18,
        ),
      ),
    );
  }
}
