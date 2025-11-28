import 'package:deehelp/core/components/icon/ui_icon_alpha.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
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
                  : const UIIConAlpha(
                      iconData: Icons.camera_alt,
                      color: AppColors.primaryColor,
                    )
              : null,
        ),
        if (showDivider)
          const Divider(color: AppColors.lightGreyColor30, height: 1),
      ],
    );
  }
}
