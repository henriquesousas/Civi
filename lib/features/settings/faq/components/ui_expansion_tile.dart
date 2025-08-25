import 'package:flutter/material.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class UiExpansionTile extends StatelessWidget {
  final String question;
  final String answer;
  final ValueChanged<bool>? onExpansionChanged;
  final TextStyle? answerStyle;
  final bool expanded;
  const UiExpansionTile({
    super.key,
    required this.question,
    required this.answer,
    this.onExpansionChanged,
    this.answerStyle,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
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
          // initiallyExpanded: expanded,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          collapsedBackgroundColor:
              Theme.of(context).colorScheme.secondaryContainer,
          title: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SizeConfig.padding12),
            child: Text(
              question,
              style: answerStyle ?? context.getTextStyle.smallMedium,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
          ),
          clipBehavior: Clip.antiAlias,
          childrenPadding: const EdgeInsets.only(
            bottom: SizeConfig.padding12,
            right: SizeConfig.padding12,
            left: SizeConfig.padding12,
          ),
          onExpansionChanged: (value) {
            if (onExpansionChanged != null) {
              onExpansionChanged!(value);
            }
          },
          children: [
            const Divider(color: AppColors.lineColor, height: 0),
            const SizedBox(height: SizeConfig.height12),
            Text(answer,
                style: context.getTextStyle.small.copyWith(
                  color: AppColors.textSecondary,
                )),
          ],
        ),
      ),
    );
  }
}
