import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'header_text.dart';

class HeaderTextCard extends StatelessWidget {
  final String header;
  final String text;

  const HeaderTextCard({super.key, required this.header, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(
          textAlign: TextAlign.start,
          text: header,
          textStyle: context.appTextStyles.sectionTitle.copyWith(
            // color: AppColors.textColorBody,
            // fontSize: 16.0,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 3),
        HeaderText(
          textAlign: TextAlign.start,
          text: text,
          textStyle: context.appTextStyles.sectionTitle.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 11,
            // color: AppColors.textColorBody,
            color: Theme.of(context).colorScheme.surfaceDim,
          ),
        ),
      ],
    );
  }
}
