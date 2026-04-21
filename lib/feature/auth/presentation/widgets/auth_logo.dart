import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class LogoBlock extends StatelessWidget {
  const LogoBlock({super.key});

  @override
  Widget build(BuildContext context) {
    // final logoUrl = context.isDark()
    //     ? "assets/images/logo_black_v2.png"
    //     : "assets/images/logo_white.jpeg";
    return Column(
      children: [
        Image.asset(
          "assets/images/spoken_logo_v2.png",
          width: ImageSize.xxl,
          fit: BoxFit.cover,
        ),
        // const SizedBox(height: 5),
        Text(
          'Civi',
          textAlign: TextAlign.center,
          style: context.appTextOld.headerxl.copyWith(
            color: context.primaryTextColor,
            fontWeight: FontWeight.bold,
            height: 1.05,
            letterSpacing: -0.4,
          ),
        ),
      ],
    );
  }
}
