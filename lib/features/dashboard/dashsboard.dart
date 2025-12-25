import 'package:deehelp/core/ui/assets/resources.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashsboard extends StatelessWidget {
  const Dashsboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: UICustomScaffold(
        hideAppBar: true,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ícone
                    UIICon(
                      padding: 8.w,
                      bgColor: AppColors.whiteColor,
                      icon: const Icon(
                        Icons.person,
                        color: AppColors.darkGreyColor10,
                      ),
                      border: Border.all(
                        color: AppColors.lightGreyColor30,
                        width: 1,
                      ),
                    ),

                    // Título e search
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '[LABEL]',
                            style: context.appTextStyles.sectionTitle
                                .copyWith(fontSize: 22.sp),
                          ),
                          SizedBox(height: 20.h),
                          _buildSearchContainer(context),
                        ],
                      ),
                    ),

                    Center(
                      child: Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Aqui aparecerá as ocorrências que foram \nregistradas nas últimas horas.",
                          style: context.appTextStyles.caption2Style,
                        ),
                      ),
                    ),

                    // Espaço extra para scroll
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            UICustomAppCard(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ações rápidas",
                    style: context.appTextStyles.sectionBodyTextStyle.copyWith(
                      color: AppColors.dark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildOption(
                        context: context,
                        title: "Novo\nPatrimônio",
                        color: AppColors.primaryColor,
                        icon:
                            const Icon(Icons.add, color: AppColors.whiteColor),
                        onTap: () => debugPrint("clicked"),
                      ),
                      _buildOption(
                        context: context,
                        title: "Novo\nAlertar",
                        color: AppColors.grenColor,
                        icon: const Icon(Icons.campaign_outlined,
                            color: AppColors.whiteColor),
                        onTap: () => debugPrint("clicked"),
                      ),
                      _buildOption(
                        context: context,
                        title: "Ver\nMapa",
                        color: AppColors.lightGreyColor,
                        icon: const Icon(Icons.explore_outlined,
                            color: AppColors.darkGreyColor10),
                        onTap: () => debugPrint("clicked"),
                      ),
                      _buildOption(
                        context: context,
                        title: "Tirar\nDúvidas",
                        color: AppColors.lightGreyColor,
                        icon: const Icon(Icons.contact_support_outlined,
                            color: AppColors.darkGreyColor10),
                        onTap: () => debugPrint("clicked"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required String title,
    required Widget icon,
    required BuildContext context,
    required VoidCallback onTap,
    Color color = AppColors.whiteColor,
    bool enableHaptic = true,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          if (enableHaptic) {
            HapticFeedback.lightImpact(); // Feedback tátil
          }
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UIICon(
                bgColor: color,
                icon: icon,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.appTextStyles.caption2Style.copyWith(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSearchContainer(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: EdgeInsets.all(Dimens.size22.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(Dimens.defaultButtonRadius.w),
        border: Border.all(
          color: AppColors.lightGreyColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Faça um pesquisa...',
            style: context.appTextStyles.bodyTextStyle1,
          ),
          UIICon(
            padding: 8.w,
            bgColor: AppColors.darkGreyColor10,
            icon: SvgPicture.asset(
              R.svg.search,
              width: 18.w,
            ),
          )
        ],
      ),
    );
  }
}
