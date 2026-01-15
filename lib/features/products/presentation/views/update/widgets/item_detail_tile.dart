import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/ui/theme/app_colors.dart';

class ItemDetailTile extends StatelessWidget {
  final String title;
  final bool showDivider;
  final bool showCam;
  final bool showIconEdit;
  final VoidCallback? press;
  final Widget? trailing;
  final Widget? leading;
  final String? subtitle;

  const ItemDetailTile({
    super.key,
    required this.title,
    this.subtitle,
    this.showDivider = true,
    this.showCam = false,
    this.showIconEdit = true,
    this.press,
    this.trailing,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          title: Text(
            title,
            style: context.appTextStyles.bodyTextStyle1.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textColorBody,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: context.appTextStyles.sectionBodyTextStyle.copyWith(
                    color: AppColors.textSecondary.withValues(alpha: 0.7),
                  ),
                )
              : null,

          leading: leading,
          trailing: _getTrailing(),
          // trailing: trailing == null
          //     ? showIconEdit
          //         ? !showCam
          //             ? IconButton(
          //                 onPressed: press,
          //                 icon: const Icon(
          //                   Icons.edit,
          //                   color: AppColors.greyColor,
          //                 ),
          //               )
          //             : const UIICon(
          //                 isAlpha: true,
          //                 icon: Icon(Icons.camera_alt),
          //                 bgColor: AppColors.primaryColor,
          //               )
          //         : null
          //     : trailing!,
        ),
        if (showDivider)
          const Divider(color: AppColors.lightGreyColor30, height: 1),
      ],
    );
  }

  Widget? _getTrailing() {
    if (trailing != null) return trailing;
    if (!showIconEdit) return null;
    return showCam
        ? const UIICon(
            isAlpha: true,
            icon: Icon(Icons.camera_alt),
            bgColor: AppColors.primaryColor,
          )
        : IconButton(
            onPressed: press,
            icon: const Icon(
              Icons.edit,
              color: AppColors.greyColor,
            ),
          );
  }
}
