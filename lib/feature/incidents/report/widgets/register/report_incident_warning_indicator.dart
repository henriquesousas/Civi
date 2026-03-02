import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/button/ui_category_button.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';

class ReportIncidentWarningIndicator extends StatelessWidget {
  const ReportIncidentWarningIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.successColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.successColor.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.warning_amber,
            size: Dimens.size20,
            color: AppColors.textColorBody,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "EM CASO DE PERIGO IMEDIATO:",
                  style: context.appTextStyles.sectionSubTitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColorBody,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Ligue para a polícia → 190",
                  style: context.appTextStyles.sectionBodyTextStyle.copyWith(
                    // fontWeight: FontWeight.w400,
                    color: AppColors.textColorBody,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
          UICategoryButton(
            text: "EMERGÊNCIA",
            color: AppColors.successColor,
            press: () {
              UrlLauncherUtils.makePhoneCall("190");
            },
          ),
        ],
      ),
    );
  }
}
