import 'package:flutter/material.dart';
import 'package:deehelp/l10n/app_localizations.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.appName,
          style: context.getTextStyle.medium.copyWith(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 10),
        Text(
          AppLocalizations.of(context)!.splashContent,
          textAlign: TextAlign.center,
          style: context.getTextStyle.smallMedium.copyWith(
            color: Colors.white.withValues(alpha: 0.9),
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
