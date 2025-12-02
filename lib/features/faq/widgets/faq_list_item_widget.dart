import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/theme/dimens.dart';
import 'package:deehelp/core/widgets/card/ui_custom_app_card.dart';
import 'package:flutter/material.dart';

import 'expanded_section.dart';

class FaqListItemWidget extends StatelessWidget {
  final String question;
  final String answer;
  final int index;
  final int selectedIndex;
  final VoidCallback press;
  final bool showBorder;

  const FaqListItemWidget({
    super.key,
    required this.answer,
    required this.question,
    required this.index,
    required this.press,
    required this.selectedIndex,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      onPressed: press,
      margin: const EdgeInsetsDirectional.symmetric(vertical: 4),
      radius: Dimens.defaultRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  question,
                  style: context.appTextStyles.sectionTitle3.copyWith(
                    color: AppColors.textColorHeader,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: Icon(
                  index == selectedIndex
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.textColorBody,
                  size: 20,
                ),
              ),
            ],
          ),
          ExpandedSection(
            expand: index == selectedIndex,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  answer,
                  style: context.appTextStyles.sectionSubTitle1.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
