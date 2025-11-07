import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/constants.dart';
import 'package:flutter/material.dart';

class UIExpansionTile extends StatelessWidget {
  final String question;
  final String answer;
  final ValueChanged<bool>? onExpansionChanged;
  final TextStyle? answerStyle;
  final bool expanded;
  const UIExpansionTile({
    super.key,
    required this.question,
    required this.answer,
    this.onExpansionChanged,
    this.answerStyle,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        dense: true,
        horizontalTitleGap: 0.0,
        minVerticalPadding: 12,
        minLeadingWidth: 0,
        child: ExpansionTile(
          key: PageStorageKey(question),
          backgroundColor: AppColors.lightGreyColor20.withValues(alpha: 0.2),
          collapsedBackgroundColor: colorScheme.secondaryContainer,
          collapsedIconColor: AppColors.greyColor,
          iconColor: AppColors.greyColor,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              question,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
            side: const BorderSide(
              width: 1,
              color: AppColors.lightGreyColor20,
            ),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
            side: const BorderSide(
              width: 1,
              color: AppColors.lightGreyColor20,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          childrenPadding: const EdgeInsets.only(
            bottom: defaultPadding,
            right: defaultPadding,
            left: defaultPadding,
          ),
          onExpansionChanged: (value) {
            if (onExpansionChanged != null) {
              onExpansionChanged!(value);
            }
          },
          children: [
            Text(
              answer,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
