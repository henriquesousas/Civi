import 'package:deehelp/core/components/icon/ui_icon_alpha.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/divider/ui_divider.dart';
import 'package:deehelp/core/widgets/text-field/ui_text_field_rounded.dart';
import 'package:deehelp/features/map/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class SlidingOccurrencesPanel extends StatelessWidget {
  final List<RouboMarker> occurrences;
  final double panelPosition;

  const SlidingOccurrencesPanel({
    super.key,
    required this.occurrences,
    required this.panelPosition,
  });

  @override
  Widget build(BuildContext context) {
    final textOpacity = (1 - (panelPosition / 0.8)).clamp(0.0, 1.0);
    final textFieldOpacity = ((panelPosition - 0.7) / 0.1).clamp(0.0, 1.0);
    final showTextField = panelPosition >= 0.8;
    final iconColor = AppColors.textColorBody.withValues(alpha: 0.6);

    return Column(
      children: [
        const UIDivider(),
        if (!showTextField) ...[
          Opacity(
            opacity: textOpacity,
            child: IgnorePointer(
              ignoring: panelPosition > 0.7,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    child: Row(
                      children: [
                        Text(
                          "Ocorrências nesta região 35",
                          style:
                              context.appTextStyles.sectionSubTitle1.copyWith(
                            color: AppColors.bodyText,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.search,
                          color: AppColors.bodyText.withValues(alpha: 0.6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        if (showTextField) ...[
          Opacity(
            opacity: textFieldOpacity,
            child: IgnorePointer(
              ignoring: panelPosition < 0.7,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.w),
                child: Row(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const UIIConAlpha(
                      iconData: Icons.close,
                      color: AppColors.blackColor,
                    ),
                    Expanded(
                      child: UITextFieldRounded(
                        labelText: "",
                        hintText: "Toque para pesquisar...",
                        showLabelText: false,
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Icon(
                          Icons.search,
                          color: iconColor,
                        ),
                        suffixIcon: Icon(
                          Icons.mic_none,
                          color: iconColor,
                        ),
                        fillColor: AppColors.bodyText.withValues(alpha: 0.1),
                        focusBorderColor: AppColors.primaryColor,
                        borderColor:
                            AppColors.textTertiary.withValues(alpha: 0.4),
                        borderRadius: 8,
                        hintStyle:
                            context.appTextStyles.bodyTextStyle1.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorBody.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: occurrences.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            itemBuilder: (context, index) {
              final occurrence = occurrences[index];
              return ListTile(
                title: Text(
                  occurrence.titulo,
                  style: context.appTextStyles.bodyTextStyle1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  "Osasco - Barueri Rua Chico Mendes",
                  style: context.appTextStyles.bodyTextStyle2.copyWith(),
                ),
                leading: Container(
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.campaign,
                    // size: 18,
                    color: AppColors.blackColor60,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
