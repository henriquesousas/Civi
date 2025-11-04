import 'package:deehelp/l10n/app_localizations.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "DeeHelp",
          style: context.getTextStyle.medium.copyWith(
            color: Colors.white,
            fontSize: context.responsiveText(0.065),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppLocalizations.of(context)!.splashContent,
          textAlign: TextAlign.center,
          style: context.getTextStyle.smallMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.w300,
              fontSize: context.responsiveText(0.032)),
        ),
      ],
    );
  }
}
