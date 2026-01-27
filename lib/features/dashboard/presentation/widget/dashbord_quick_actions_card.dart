import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/dashboard/presentation/widget/quick_action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DashbordQuickActionsCard extends StatelessWidget {
  const DashbordQuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      padding: EdgeInsets.all(Dimens.size20.w),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuickActionItem(
                  title: "Bem\nPré cadastro",
                  color: AppColors.primaryColor,
                  icon: const Icon(Icons.add, color: AppColors.whiteColor),
                  onTap: () => context.push(AppRouter.addProduct),
                ),
                QuickActionItem(
                  title: "Reportar\nincidente",
                  color: AppColors.grenColor,
                  icon: const Icon(Icons.campaign_outlined,
                      color: AppColors.whiteColor),
                  onTap: () => context.push(AppRouter.reportIncident),
                ),
                QuickActionItem(
                  title: "Ligar\nPolícia",
                  color: AppColors.lightGreyColor,
                  icon: const Icon(
                    Icons.local_police,
                    color: AppColors.darkGreyColor10,
                  ),
                  onTap: () {},
                ),
                QuickActionItem(
                  title: "Ver\nMapa",
                  color: AppColors.lightGreyColor,
                  icon: const Icon(Icons.explore_outlined,
                      color: AppColors.darkGreyColor10),
                  onTap: () => context.push(AppRouter.map),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
