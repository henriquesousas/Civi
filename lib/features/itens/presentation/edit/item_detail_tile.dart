import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ItemDetailTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showDivider;
  final bool showCam;

  const ItemDetailTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.showDivider = true,
    this.showCam = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: !showCam
              ? const Icon(
                  Icons.edit,
                  color: AppColors.lightGreyColor20,
                )
              : Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
        ),
        if (showDivider)
          const Divider(color: AppColors.lightGreyColor30, height: 1),
      ],
    );
  }
}
