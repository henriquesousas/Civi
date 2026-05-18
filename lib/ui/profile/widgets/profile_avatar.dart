import 'package:deehelp/old_core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/ui/profile/widgets/verification_icon_badge.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: CustomNetworkImage(
            width: SizeImage.m.w,
            height: SizeImage.m.h,
            imageUrl: "https://i.pravatar.cc/300",
            radius: SizeImage.m,
          ),
        ),
        const Positioned(
          right: 0,
          bottom: 0,
          child: VerificationIconBadge(),
        ),
      ],
    );
  }
}
