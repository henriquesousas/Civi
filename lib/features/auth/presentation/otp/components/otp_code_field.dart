import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../app/theme/app_colors_v2.dart';

class OtpCodeField extends StatelessWidget {
  const OtpCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                width: context.percentWidth(0.2),
                height: 60,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  style: context.getTextStyle.medium.copyWith(
                    color: AppColorsV2.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.symmetric(
                    //   vertical: 12,
                    //   horizontal: 12,
                    // ),
                  ),
                  onChanged: (value) => {},
                  onTap: () {
                    // Clear field when tapped
                  },
                  onSubmitted: (_) {},
                  onEditingComplete: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
