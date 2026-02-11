import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/widgets/divider/ui_divider.dart';
import 'package:deehelp/old_core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/old_features/incident/domain/entity/incident.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../old_core/resources.dart';
import '../../../old_core/ui/theme/app_colors.dart';

class SlidingOccurrencesPanel extends StatelessWidget {
  final List<Incident> occurrences;
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
        // if (!showTextField) ...[
        //   Opacity(
        //     opacity: textOpacity,
        //     child: IgnorePointer(
        //       ignoring: panelPosition > 0.7,
        //       child: Column(
        //         children: [
        //           Padding(
        //             padding: EdgeInsets.all(Dimens.size20.w),
        //             child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Text(
        //                     "Avenida João ventura dos santos , Osasco - São Paulo",
        //                     maxLines: 2,
        //                     style:
        //                         context.appTextStyles.sectionSubTitle1.copyWith(
        //                       color: AppColors.bodyText,
        //                     ),
        //                   ),
        //                 ),
        //                 // const Spacer(),
        //                 const SizedBox(width: 10),
        //                 SvgPicture.asset(
        //                   R.svg.search,
        //                   width: Dimens.size20.w,
        //                   colorFilter: const ColorFilter.mode(
        //                       AppColors.textColorBody, BlendMode.srcIn),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ],
        // if (showTextField) ...[
        //   Opacity(
        //     opacity: textFieldOpacity,
        //     child: IgnorePointer(
        //       ignoring: panelPosition < 0.7,
        //       child: Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.w),
        //         child: Row(
        //           spacing: 2,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             const UIICon(
        //               isAlpha: true,
        //               icon: Icon(Icons.close),
        //               bgColor: AppColors.blackColor,
        //             ),
        //             Expanded(
        //               child: UITextFieldRounded(
        //                 labelText: "",
        //                 hintText: "Toque para pesquisar...",
        //                 showLabelText: false,
        //                 contentPadding: EdgeInsets.zero,
        //                 prefixIcon: Icon(
        //                   Icons.search,
        //                   color: iconColor,
        //                 ),
        //                 suffixIcon: Icon(
        //                   Icons.mic_none,
        //                   color: iconColor,
        //                 ),
        //                 fillColor: AppColors.bodyText.withValues(alpha: 0.1),
        //                 focusBorderColor: AppColors.primaryColor,
        //                 borderColor:
        //                     AppColors.textTertiary.withValues(alpha: 0.4),
        //                 borderRadius: 8,
        //                 hintStyle:
        //                     context.appTextStyles.bodyTextStyle1.copyWith(
        //                   fontWeight: FontWeight.w500,
        //                   color: AppColors.textColorBody.withValues(alpha: 0.8),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: occurrences.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            itemBuilder: (context, index) {
              final incident = occurrences[index];
              return ListTile(
                title: Text(
                  "${incident.product.name}, placa ${incident.product.code} roubado.",
                  style: context.appTextStyles.bodyTextStyle1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  incident.local != null
                      ? "${incident.local?.address},${incident.local?.city}, ${incident.local?.address}"
                      : '',
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
                trailing: Text(
                  "12KM",
                  style: context.appTextStyles.caption1Style,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
