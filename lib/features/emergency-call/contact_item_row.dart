import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/features/emergency-call/public_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/ui/theme/app_colors.dart';

class ContactItemRow extends StatelessWidget {
  final PublicContactModel contact;
  final VoidCallback? press;

  const ContactItemRow({
    super.key,
    required this.contact,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      margin: const EdgeInsets.symmetric(vertical: 5),
      borderColor: AppColors.greyColor,
      radius: 9,
      borderWidth: 1,
      padding: EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press != null
              ? () {
                  HapticFeedback.lightImpact();
                  press!();
                }
              : null,
          borderRadius: BorderRadius.circular(12),
          splashColor: AppColors.primaryColor.withValues(alpha: 0.1),
          highlightColor: AppColors.primaryColor.withValues(alpha: 0.05),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.sectionTitle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColorBody,
                      ),
                    ),
                    Text(
                      contact.phone,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.caption1Style.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 1,
                  height: Dimens.size40.h,
                  color: AppColors.lightGreyColor20,
                ),
                const UIICon(
                  isAlpha: true,
                  bgColor: AppColors.primaryColor,
                  icon: Icon(
                    Icons.phone,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
