import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_modal_bottom_sheet.dart';
import '../../../core/components/ui_my_assets_image_widget.dart';
import '../../../core/ui/assets/resources.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/dimens.dart';
import '../../../core/widgets/card/ui_custom_app_card.dart';
import '../../../core/widgets/card/ui_custon_list_tile_card.dart';
import 'logout_modal.dart';

class ProfileLogout extends StatelessWidget {
  const ProfileLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      padding: Dimens.of(context).edgeInsetsScreenHorizontal,
      child: UICustomListTileCard(
        title: "R.strings.exitApp",
        showBorder: false,
        titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
          color: AppColors.textColorBody,
        ),
        leading: UIMyAssetsImageWidget(
          isSvg: true,
          assetPath: R.images.svgLogout,
          width: 24,
          height: 24,
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
            // maxHeight: context.percentHeight(0.3),
            child: const LogoutModal(),
          );
        },
      ),
    );
  }
}
