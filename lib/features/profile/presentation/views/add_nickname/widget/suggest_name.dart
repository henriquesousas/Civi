import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/ui/theme/app_colors.dart';

class SuggestName extends StatelessWidget {
  final List<String> suggestedNicknames;
  final Function(String) press;
  const SuggestName(
      {super.key, required this.suggestedNicknames, required this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * suggestedNicknames.length * 0.08,
      decoration: BoxDecoration(
        // color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        // border:
        //     BoxBorder.all(color: AppColors.lightGreyColor30, width: 1),
      ),
      child: ListView.builder(
        itemCount: suggestedNicknames.length,
        itemBuilder: (context, index) {
          BorderRadius borderRadius;
          final nickname = suggestedNicknames[index];
          final borderFirst = const BorderRadius.only(
            topLeft: Radius.circular(Dimens.size20),
            topRight: Radius.circular(Dimens.size20),
          );
          final borderLast = const BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.size20),
            bottomRight: Radius.circular(Dimens.size20),
          );

          if (index == 0) {
            borderRadius = borderFirst;
          } else if (index == suggestedNicknames.length - 1) {
            borderRadius = borderLast;
          } else {
            borderRadius = BorderRadius.circular(0);
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: BoxBorder.all(color: AppColors.greyColor, width: 1),
            ),
            child: ListTile(
              title: Text(nickname),
              onTap: () => press(nickname),
            ),
          );
        },
      ),
    );
  }
}
