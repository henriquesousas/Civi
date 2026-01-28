import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/features/auth/external/di/authenticated_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/ui/widgets/image/ui_my_assets_image_widget.dart';
import '../../../../../../core/resources.dart';
import '../../../../../../core/ui/router/app_router.dart';
import '../../../../../../core/ui/theme/app_colors.dart';
import '../../../../../../core/ui/theme/dimens.dart';
import '../../../../../../core/ui/widgets/card/ui_custom_app_card.dart';
import '../../../../../../core/ui/widgets/card/ui_custon_list_tile_card.dart';

class ProfileContent extends ConsumerWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final session = ref.watch(authenticatedUserProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.defaultPadding),
      child: UICustomAppCard(
        radius: 0,
        padding: Dimens.of(context).edgeInsetsScreenHorizontal,
        child: Column(
          children: [
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              title: "Patrimônio",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.addProduct,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: Dimens.defaultArrowForward,
                color: AppColors.textColorHeader.withValues(alpha: 0.5),
              ),
              press: () => context.push(AppRouter.myProducts),
            ),
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              // title: "R.strings.lastOccurrences",
              title: "Minhas ocorrências",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.reportIncident,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: Dimens.defaultArrowForward,
                color: AppColors.textColorHeader.withValues(alpha: 0.5),
              ),
              press: () => context.push(AppRouter.incidents),
            ),
            // UICustomListTileCard(
            //   padding: const EdgeInsetsDirectional.symmetric(
            //     vertical: Dimens.defaultPadding,
            //   ),
            //   // title: R.strings.favorites,
            //   title: "Favoritos",
            //   showBorder: true,
            //   titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
            //     color: AppColors.textColorBody,
            //   ),
            //   leading: UIMyAssetsImageWidget(
            //     isSvg: true,
            //     assetPath: R.svg.bookmark,
            //     width: Dimens.size24.w,
            //     height: Dimens.size24.h,
            //     boxFit: BoxFit.scaleDown,
            //     color: AppColors.primaryColor,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_rounded,
            //     size: Dimens.defaultArrowForward,
            //     color: AppColors.textColorHeader.withValues(alpha: 0.5),
            //   ),
            //   press: () {},
            // ),
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
                assetPath: R.svg.search,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
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
              title: "Avaliar",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.wshlist,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
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
              title: "Fale conosco",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.help,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
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
                "Olá! 👋 Queremos a sua ajuda para melhorar o app DeeHelp. Diga-nos: Qual é a sua dúvida ou sugestão sobre o funcionamento ou segurança? Sua opinião é essencial!",
              ),
            ),
            // if (session != null) ...[
            //   UICustomListTileCard(
            //     padding: const EdgeInsetsDirectional.symmetric(
            //       vertical: Dimens.defaultPadding,
            //     ),
            //     title: "Meu apelido",
            //     showBorder: true,
            //     titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
            //       color: AppColors.textColorBody,
            //     ),
            //     leading: UIMyAssetsImageWidget(
            //       isSvg: true,
            //       assetPath: R.svg.inactiveProfile,
            //       width: Dimens.size24.w,
            //       height: Dimens.size24.h,
            //       boxFit: BoxFit.scaleDown,
            //       color: AppColors.primaryColor,
            //     ),
            //     trailing: Container(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            //       decoration: BoxDecoration(
            //         color: AppColors.lightGreyColor20,
            //         borderRadius: BorderRadius.circular(20.w),
            //       ),
            //       child: Text(
            //         session.nickName ?? '',
            //         style: context.appTextStyles.caption2Style.copyWith(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     press: () => context.push(AppRouter.faq),
            //   ),
            // ],
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              title: "Perguntas e respostas",
              showBorder: true,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.faq,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: Dimens.defaultArrowForward,
                color: AppColors.textColorHeader.withValues(alpha: 0.5),
              ),
              press: () => context.push(AppRouter.faq),
            ),
            UICustomListTileCard(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: Dimens.defaultPadding,
              ),
              title: "Versão",
              subtitle: "Confira se sua versão está atualizada",
              showBorder: false,
              titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textColorBody,
              ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.info,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: const Text("1.0.0"),
              press: () => context.push(AppRouter.faq),
            ),
          ],
        ),
      ),
    );
  }
}
