import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/ui/assets/resources.dart';
import '../../../../core/ui/theme/app_colors.dart';
import '../../../../core/ui/theme/dimens.dart';
import '../../../../core/ui/widgets/image/ui_my_network_image_widget.dart';

class IncidentInfo extends StatelessWidget {
  final String howTo;
  final String imageUrl;
  const IncidentInfo({
    super.key,
    required this.howTo,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4),
        border: const Border(
          bottom: BorderSide(
            color: AppColors.lightGreyColor30,
            width: 1.0,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.size10.w, vertical: Dimens.size20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                SvgPicture.asset(
                  R.images.svgStatementInactive,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textColorBody,
                    BlendMode.srcIn,
                  ),
                ),
                Expanded(
                  child: Text(
                    howTo,
                    style: context.appTextStyles.bodyTextStyle2.copyWith(
                      color: AppColors.textColorBody,
                      fontSize: Dimens.size14.sp,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            UIMyNetworkImageWidget(imageUrl: imageUrl),
          ],
        ),
      ),
    );
  }
}
