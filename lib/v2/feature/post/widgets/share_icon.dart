import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:deehelp/v2/core/theme/size_icon.dart';
import 'package:flutter/material.dart';

class ShareIcon extends StatelessWidget {
  const ShareIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        const Icon(
          Icons.reply,
          size: SizeIcon.m,
          color: Colors.white,
        ),
        Text(
          'Compartilhar',
          style: context.appText.subtitle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
