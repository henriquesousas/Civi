import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';

class DashboardIncidentList extends StatelessWidget {
  final List<String> items;
  const DashboardIncidentList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * items.length * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) {
          BorderRadius borderRadius;
          final item = items[index];
          final borderFirst = const BorderRadius.only(
            topLeft: Radius.circular(Dimens.size20),
            topRight: Radius.circular(Dimens.size20),
          );
          final borderLast = const BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.size20),
            bottomRight: Radius.circular(Dimens.size20),
          );

          if (items.length == 1) {
            borderRadius = BorderRadius.circular(Dimens.size20);
          } else {
            if (index == 0) {
              borderRadius = borderFirst;
            } else if (index == items.length - 1) {
              borderRadius = borderLast;
            } else {
              borderRadius = BorderRadius.circular(0);
            }
          }

          return Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: borderRadius,
              border: Border(
                top: const BorderSide(
                  color: AppColors.lightGreyColor20,
                  width: 1,
                ),
                left: const BorderSide(
                  color: AppColors.lightGreyColor20,
                  width: 1,
                ),
                right: const BorderSide(
                  color: AppColors.lightGreyColor20,
                  width: 1,
                ),
                bottom: index == items.length - 1
                    ? const BorderSide(
                        color: AppColors.lightGreyColor20, width: 1)
                    : BorderSide.none,
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    item,
                    style: context.appTextStyles.buttonTextStyle1.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    "DND0171",
                    style: context.appTextStyles.caption2Style.copyWith(
                      color: AppColors.textColorBody,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: AppColors.textSecondary,
                    // size: 14.sp,
                  ),
                  onTap: () => {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
