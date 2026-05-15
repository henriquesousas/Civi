import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/ui/auth/auth_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AuthRouter.path),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
        child: Column(
          children: [
            CircleAvatar(
              radius: SizeIcon.x.w,
              backgroundColor: const Color(0xFFDDE6D1),
              child: const Icon(
                Icons.person,
                color: Color(0xFF252A20),
                size: SizeIcon.x,
              ),
            ),
            const SizedBox(height: SizeSpacing.m),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paulo Soares',
                  style: context.appText.title.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: SizeSpacing.xs),
                Text(
                  'paulo@email.com',
                  style: context.appText.subtitle.copyWith(
                    color: context.themeColor.secundaryTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
