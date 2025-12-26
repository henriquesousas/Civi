import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/bottom_sheet/custom_modal_bottom_sheet.dart';
import '../../../core/ui/widgets/image/ui_my_assets_image_widget.dart';
import '../../../core/ui/assets/resources.dart';
import '../../../core/ui/theme/app_colors.dart';
import '../../../core/ui/theme/dimens.dart';
import '../../../core/ui/widgets/card/ui_custom_app_card.dart';
import '../../../core/ui/widgets/card/ui_custon_list_tile_card.dart';
import 'logout_modal.dart';

class ProfileLogout extends StatelessWidget {
  const ProfileLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      padding: Dimens.of(context).edgeInsetsScreenHorizontal,
      child: UICustomListTileCard(
        title: "Sair da conta",
        showBorder: false,
        titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
          color: AppColors.textColorBody,
        ),
        leading: UIMyAssetsImageWidget(
          isSvg: true,
          assetPath: R.images.svgLogout,
          width: Dimens.size22.w,
          height: Dimens.size22.h,
          boxFit: BoxFit.scaleDown,
          color: AppColors.primaryColor,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: Dimens.defaultArrowForward,
          color: AppColors.textColorHeader.withValues(alpha: 0.5),
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
