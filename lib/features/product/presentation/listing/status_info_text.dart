import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/theme/dimens.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StatusInfoText extends StatelessWidget {
  final VoidCallback onLearnMoreTap;

  const StatusInfoText({
    Key? key,
    required this.onLearnMoreTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color questionColor = Colors.black54;
    const Color linkColor = Colors.indigo;
    return Padding(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      child: Text.rich(
        TextSpan(
          style: context.appTextStyles.caption2Style,
          children: <TextSpan>[
            const TextSpan(
              text: 'O que significa cada status?',
              style: TextStyle(
                color: questionColor,
                fontWeight: FontWeight.normal,
              ),
            ),
            const TextSpan(text: ' '),
            TextSpan(
              text: 'saiba mais',
              style: context.appTextStyles.caption1Style.copyWith(
                color: linkColor,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = onLearnMoreTap,
            ),
          ],
        ),
      ),
    );
  }
}
