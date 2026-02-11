import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SearchInfo extends StatelessWidget {
  final String title;
  final String error;
  final Icon icon;
  const SearchInfo(
      {super.key,
      required this.error,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          // Container(
          //   width: Dimens.size60.w,
          //   height: Dimens.size60.h,
          //   decoration: BoxDecoration(
          //     color: AppColors.greyColor.withValues(alpha: 0.1),
          //     borderRadius: BorderRadius.circular(100),
          //     border: Border.all(
          //       color: AppColors.greyColor.withValues(alpha: 0.3),
          //       width: 1,
          //     ),
          //   ),
          //   child: icon,
          // ),
          // const SizedBox(height: 10),
          Text(
            title,
            style: context.appTextStyles.buttonTextStyle1.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Expanded(
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: context.appTextStyles.caption2Style.copyWith(
                // color: AppColors.textColorBody,
                color: Theme.of(context).colorScheme.surfaceDim,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
