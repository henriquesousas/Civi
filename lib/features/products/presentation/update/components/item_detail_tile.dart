import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../core/ui/theme/app_colors.dart';

class ItemDetailTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showDivider;
  final bool showCam;
  final bool showIconEdit;
  final VoidCallback? press;

  const ItemDetailTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.showDivider = true,
    this.showCam = false,
    this.showIconEdit = true,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          title: Text(
            title,
            style: context.appTextStyles.sectionTitle,
          ),
          subtitle: Text(
            subtitle,
            style: context.appTextStyles.bodyTextStyle1.copyWith(
              color: AppColors.textSecondary.withValues(alpha: 0.7),
            ),
          ),
          trailing: showIconEdit
              ? !showCam
                  ? IconButton(
                      onPressed: press,
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.greyColor,
                      ),
                    )
                  : const UIICon(
                      icon: Icon(Icons.camera_alt),
                      bgColor: AppColors.primaryColor,
                    )
              : null,
        ),
        if (showDivider)
          const Divider(color: AppColors.lightGreyColor30, height: 1),
      ],
    );
  }
}
