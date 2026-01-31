import 'package:deehelp/core/resources.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custon_list_tile_card.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logout_modal.dart';

class ProfileLogout extends StatelessWidget {
  const ProfileLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      radius: 8,
      padding: Dimens.of(context).edgeInsetsScreenHorizontal,
      child: UICustomListTileCard(
        // title: "Sair da conta",
        padding: EdgeInsetsDirectional.symmetric(
          vertical: Dimens.size20.w,
        ),

        titleWidget: Text(
          "Sair",
          style: context.appTextStyles.bodyTextStyle1.copyWith(
            color: AppColors.errorColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        showBorder: false,
        titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
          color: AppColors.textColorBody,
        ),
        leading: UIMyAssetsImageWidget(
          isSvg: true,
          assetPath: R.svg.logout,
          width: Dimens.size22.w,
          height: Dimens.size22.h,
          boxFit: BoxFit.scaleDown,
          color: AppColors.errorColor,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: Dimens.defaultArrowForward,
          color: AppColors.errorColor,
        ),
        press: () {
          customModalBottomSheet(
            context,
            child: const LogoutModal(),
          );
        },
      ),
    );
  }
}
