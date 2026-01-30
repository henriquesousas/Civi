// ignore_for_file: unnecessary_null_comparison

import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/avatar/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
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
    AuthenticatedUser? session = ref.watch(authenticatedUserProvider);
    final verticalSize = Dimens.size16.w;
    final trailingColor = Theme.of(context).colorScheme.outline;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.defaultPadding),
      child: UICustomAppCard(
        radius: 8,
        // padding: Dimens.of(context).edgeInsetsScreenHorizontal,
        child: Column(
          children: [
            UICustomListTileCard(
              padding: EdgeInsetsDirectional.symmetric(vertical: verticalSize),
              title: session?.name ?? "Entrar",
              subtitle: session?.email,
              titleStyle: context.appTextStyles.sectionTitle,
              showBorder: true,
              leading: session != null
                  ? ProfileImageWithUploadButtonWidget(
                      imageUrl: session.name,
                      imageAlt: session.name,
                      showUploadIcon: false,
                      width: Dimens.size32.w,
                      height: Dimens.size32.h,
                      radius: Dimens.profileImageRadius.w,
                    )
                  : UIICon(
                      bgColor: AppColors.primaryColor, //Colors.deepPurple,
                      // icon: IconButton(
                      //   icon: Icon(
                      //     Icons.person_2_outlined,
                      //     color: AppColors.whiteColor,
                      //     size: Dimens.size10.w,
                      //   ),
                      //   onPressed: () {},
                      // ),
                      padding: 8,
                      icon: const Icon(
                        Icons.person_2_outlined,
                        color: Colors.white,
                      ),
                      border: Border.all(
                        color: AppColors.lightGreyColor30,
                        width: 1,
                      ),
                    ),
              press: () => context.push(AppRouter.myProducts),
            ),
            UICustomListTileCard(
              padding: EdgeInsetsDirectional.symmetric(vertical: verticalSize),
              title: "Patrimônio",
              showBorder: true,
              // titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
              //   color: AppColors.textColorBody,
              // ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.addProduct,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: Dimens.defaultArrowForward, color: trailingColor),
              press: () => context.push(AppRouter.myProducts),
            ),
            UICustomListTileCard(
              padding: EdgeInsetsDirectional.symmetric(vertical: verticalSize),
              // title: "R.strings.lastOccurrences",
              title: "Minhas ocorrências",
              showBorder: true,
              // titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
              //   color: AppColors.textColorBody,
              // ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.reportIncident,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: Dimens.defaultArrowForward, color: trailingColor),
              press: () => context.push(AppRouter.incidents),
            ),
            UICustomListTileCard(
              padding: EdgeInsetsDirectional.symmetric(vertical: verticalSize),
              title: "Pesquisar",
              showBorder: true,
              // titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
              //   color: AppColors.textColorBody,
              // ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.search,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: Dimens.defaultArrowForward, color: trailingColor),
              press: () => context.push(AppRouter.search),
            ),
            UICustomListTileCard(
              padding: EdgeInsetsDirectional.symmetric(vertical: verticalSize),
              title: "Avaliar",
              showBorder: true,
              // titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
              //   color: AppColors.textColorBody,
              // ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.wshlist,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: Dimens.defaultArrowForward, color: trailingColor),
              press: () => UrlLauncherUtils.launchAppStorePage(
                  context,
                  " 'com.massimobiolcati.irealb'",
                  " 'com.massimobiolcati.irealb'"),
            ),
            UICustomListTileCard(
              padding: EdgeInsetsDirectional.symmetric(vertical: verticalSize),
              title: "Fale conosco",
              showBorder: true,
              // titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
              //   color: AppColors.textColorBody,
              // ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.help,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: Dimens.defaultArrowForward, color: trailingColor),
              press: () => UrlLauncherUtils.launchWhatsAppSupport(
                context,
                "+5511972732245",
                "Olá! 👋 Queremos a sua ajuda para melhorar o app DeeHelp. Diga-nos: Qual é a sua dúvida ou sugestão sobre o funcionamento ou segurança? Sua opinião é essencial!",
              ),
            ),
            UICustomListTileCard(
              padding: EdgeInsetsDirectional.symmetric(vertical: verticalSize),
              title: "Perguntas e respostas",
              showBorder: true,
              // titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
              //   color: AppColors.textColorBody,
              // ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.faq,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: Dimens.defaultArrowForward, color: trailingColor),
              press: () => context.push(AppRouter.faq),
            ),
            UICustomListTileCard(
              padding: EdgeInsetsDirectional.symmetric(vertical: verticalSize),
              title: "Nascemos agora",
              showBorder: true,
              // titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
              //   color: AppColors.textColorBody,
              // ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.info,
                width: Dimens.size26.w,
                height: Dimens.size26.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: Dimens.defaultArrowForward,
                color: Theme.of(context).colorScheme.outline,
              ),
              press: () => context.push(AppRouter.welcome),
            ),
            UICustomListTileCard(
              padding: EdgeInsetsDirectional.symmetric(vertical: verticalSize),
              title: "Versão",
              subtitle:
                  "Em desenvolvimento, confira se sua versão está atualizada",
              showBorder: false,
              // titleStyle: context.appTextStyles.bodyTextStyle1.copyWith(
              //   color: AppColors.textColorBody,
              // ),
              leading: UIMyAssetsImageWidget(
                isSvg: true,
                assetPath: R.svg.info,
                width: Dimens.size24.w,
                height: Dimens.size24.h,
                boxFit: BoxFit.scaleDown,
                color: AppColors.primaryColor,
              ),
              trailing: Text(
                "1.0.0",
                style: context.appTextStyles.caption2Style.copyWith(
                  // color: AppColors.textColorBody,
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
