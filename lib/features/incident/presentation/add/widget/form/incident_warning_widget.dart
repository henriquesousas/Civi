import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';

class IncidentWarningWidget extends StatelessWidget {
  const IncidentWarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "EMERGÊNCIA",
              style: context.appTextStyles.caption1Style.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
