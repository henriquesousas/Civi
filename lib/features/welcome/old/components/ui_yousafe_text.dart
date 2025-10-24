import 'package:flutter/material.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

class UIYouSafeText extends StatelessWidget {
  const UIYouSafeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "YouSafe",
          style: context.getTextStyle.regular,
        ),
      ],
    );
  }
}
