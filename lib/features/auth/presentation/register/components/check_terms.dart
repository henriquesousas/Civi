import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors_v2.dart';

class CheckTerms extends StatelessWidget {
  final bool value;
  final String title;
  final bool isRequired;
  final ValueChanged<bool?> onChanged;
  const CheckTerms(
      {super.key,
      required this.value,
      required this.title,
      required this.isRequired,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: value ? AppColorsV2.primary : Colors.transparent,
              border: Border.all(
                color: value ? AppColorsV2.primary : AppColorsV2.border,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: value
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  )
                : null,
          ),
          SizedBox(width: 14),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: context.getTextStyle.smallMedium.copyWith(
                  color: AppColorsV2.textSecondary,
                ),
                children: [
                  TextSpan(text: title),
                  if (isRequired)
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: AppColorsV2.error),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
