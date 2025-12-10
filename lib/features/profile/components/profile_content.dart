import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/ui_my_assets_image_widget.dart';
import '../../../core/ui/assets/resources.dart';
import '../../../core/router/router_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/dimens.dart';
import '../../../core/widgets/card/ui_custom_app_card.dart';
import '../../../core/widgets/card/ui_custon_list_tile_card.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.defaultPadding),
      child: UICustomAppCard(
        padding: Dimens.of(context).edgeInsetsScreenHorizontal,
        child: Column(
          children: [
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              title: "Meus bens",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.images.svgOrder,
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
              press: () => context.push(RouterConstant.myItems, extra: true),
            ),
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              // title: "R.strings.lastOccurrences",
              title: "ûltimas ocorrëncias",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.images.svgLock,
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
              press: () {},
            ),
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              // title: R.strings.favorites,
              title: "Favoritos",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.images.svgWishlist,
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
              press: () {},
            ),
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              title: "Pesquisar",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.images.svgSearch,
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
              press: () {},
            ),
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              title: "Avaliar aplicativo",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.images.svgWishlist,
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
              press: () => UrlLauncherUtils.launchAppStorePage(
                  context,
                  " 'com.massimobiolcati.irealb'",
                  " 'com.massimobiolcati.irealb'"),
            ),
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              title: "Enviar mensagem",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.images.svgHelp,
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
              press: () => UrlLauncherUtils.launchWhatsAppSupport(
                  context,
                  "+5511972732245",
                  "Olá! 👋 Queremos a sua ajuda para melhorar o app DeeHelp. Diga-nos: Qual é a sua dúvida ou sugestão sobre o funcionamento ou segurança? Sua opinião é essencial!"),
            ),
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              title: "FAQ",
              showBorder: false,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.images.svgFaq,
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
              press: () => context.push(RouterConstant.faq),
            ),
          ],
        ),
      ),
    );
  }
}
