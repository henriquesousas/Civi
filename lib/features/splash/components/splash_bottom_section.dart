import 'package:flutter/material.dart';
import 'package:deehelp/l10n/app_localizations.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

class SplashBottomSection extends StatelessWidget {
  const SplashBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${AppLocalizations.of(context)!.version} 1.0.0",
          style: context.getTextStyle.small.copyWith(
            color: Colors.white.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
