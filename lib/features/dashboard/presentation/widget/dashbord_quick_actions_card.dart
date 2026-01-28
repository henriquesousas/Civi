import 'package:deehelp/core/resources.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/dashboard/presentation/widget/quick_action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DashbordQuickActionsCard extends StatelessWidget {
  const DashbordQuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      width: context.percentWidth(0.95),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ações rápidas",
            style: context.appTextStyles.sectionTitle.copyWith(
              color: AppColors.dark,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuickActionItem(
                    title: "Novo\npatrimônio",
                    color: AppColors.primaryColor,
                    // icon: const Icon(Icons.add, color: AppColors.whiteColor),
                    icon: SvgPicture.asset(
                      "assets/svg/add_product.svg",
                      width: Dimens.size30.w,
                      height: Dimens.size30.h,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    onTap: () => context.push(AppRouter.addProduct),
                  ),
                  QuickActionItem(
                    title: "Reportar\nincidente",
                    color: AppColors.errorColor,
                    // icon: const Icon(
                    //   Icons.campaign_outlined,
                    //   color: AppColors.whiteColor,
                    // ),
                    icon: SvgPicture.asset(
                      "assets/svg/add_incident.svg",
                      width: Dimens.size30.w,
                      height: Dimens.size30.h,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    onTap: () => context.push(AppRouter.reportIncident),
                  ),
                  QuickActionItem(
                    title: "Chamada\nemergência",
                    color: AppColors.lightGreyColor,
                    // icon: const Icon(
                    //   Icons.local_police,
                    //   color: AppColors.darkGreyColor10,
                    // ),
                    icon: SvgPicture.asset(
                      "assets/svg/emergency_call.svg",
                      width: Dimens.size30.w,
                      height: Dimens.size30.h,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        AppColors.textColorBody,
                        BlendMode.srcIn,
                      ),
                    ),
                    onTap: () {},
                  ),
                  // QuickActionItem(
                  //   title: "Ver\nmapa",
                  //   color: AppColors.lightGreyColor,
                  //   icon: const Icon(Icons.explore_outlined,
                  //       color: AppColors.darkGreyColor10),
                  //   onTap: () => context.push(AppRouter.map),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
