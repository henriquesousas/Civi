import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardIncidentList extends StatelessWidget {
  final List<String> items;
  const DashboardIncidentList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * items.length * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteColor,
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

          if (index == 0) {
            borderRadius = borderFirst;
          } else if (index == items.length - 1) {
            borderRadius = borderLast;
          } else {
            borderRadius = BorderRadius.circular(0);
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: BoxBorder.all(
                color: AppColors.lightGreyColor20,
                width: 1,
              ),
            ),
            child: ListTile(
              title: Text(
                item,
                style: context.appTextStyles.buttonTextStyle1.copyWith(
                  fontWeight: FontWeight.w500,
                  // color: AppColors.textColorBody,
                ),
              ),
              subtitle: Text(
                "DND0171",
                style: context.appTextStyles.caption2Style.copyWith(
                  color: AppColors.textColorBody,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 12.sp,
              ),
              onTap: () => {},
            ),
          );
        },
      ),
    );
  }
}
