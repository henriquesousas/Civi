import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/feature/notification/domain/notification_alert.dart';
import 'package:deehelp/v2/feature/notification/presentation/widgets/ui_dot.dart';

class UINotificationTile extends StatelessWidget {
  final NotificationAlert item;
  const UINotificationTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeLayoutSpacing.m,
        vertical: SizeLayoutSpacing.m,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.time,
            style: context.appText.caption.copyWith(
              color: context.themeColor.secundaryTextColor,
            ),
          ),
          const SizedBox(height: SizeSpacing.s),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UIDot(),
              const SizedBox(width: SizeSpacing.m),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: context.appText.bodyLarger.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: SizeSpacing.s),
                    Text(
                      item.description,
                      style: context.appText.subtitle.copyWith(
                        color: context.themeColor.secundaryTextColor,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              if (item.image != null) ...[
                const SizedBox(width: SizeSpacing.m),
                CustomNetworkImage(
                  imageUrl: item.image!,
                  width: SizeImage.m.w,
                  height: SizeImage.m.h,
                )
              ],
            ],
          ),
        ],
      ),
    );
  }
}
