import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_profile.dart';
import 'package:deehelp/core/ui/widgets/image/profile_image_with_upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapSearch extends StatelessWidget {
  final String hintText;
  final String? avatarUrl;
  final VoidCallback onTap;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onNotificationTap;
  final int notificationCount;
  final String userName;

  const MapSearch({
    super.key,
    required this.onTap,
    this.onAvatarTap,
    this.onNotificationTap,
    this.hintText = 'Buscar aqui',
    this.avatarUrl,
    this.notificationCount = 0,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.xxxl),
        border: Border.all(
          color: const Color(0xFFEAECEF),
          width: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 16,
            spreadRadius: -2,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Row(
        children: [
          if (avatarUrl != null) ...[
            ProfileImageWithUploadButtonWidget(
              width: ImageSize.xxs,
              height: ImageSize.xxs,
              imageUrl: avatarUrl,
              imageAlt: userName,
              onTap: () {},
            )
          ] else ...[
            ButtonProfile(
              onTap: () {},
            )
          ],
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              hintText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appText.bodySmall.copyWith(
                height: 1.5,
                color: AppColors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          // SearchNotificationAction(
          //   count: notificationCount,
          //   onTap: onNotificationTap ?? onTap,
          // ),
        ],
      ),
    );
  }
}
