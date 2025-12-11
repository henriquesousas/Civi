// import 'package:flutter/widgets.dart';

// import '../../l10n/app_localizations.dart';

// // extension AppLocalizationsExtension on BuildContext {
// //   AppLocalizations get strings => AppLocalizations.of(this)!;
// // }
import 'dart:math' as math;
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double calculateTextWidth(String text, double percent) {
    final maxWidth = percentWidth(percent);

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: appTextStyles.caption1Style,
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return math.min(textPainter.size.width, maxWidth);
  }
}
