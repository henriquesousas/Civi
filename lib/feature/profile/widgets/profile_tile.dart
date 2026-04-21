import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/feature/profile/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/ui/widgets/icon/export_icon.dart';

class ProfileTile extends StatelessWidget {
  final ProfileItem item;
  final VoidCallback? press;

  const ProfileTile({
    super.key,
    required this.item,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = item.isDestructive ? Colors.redAccent : context.onSurface;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: const Color(0xFF2B5BEE).withValues(alpha: 0.06),
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: LayoutSpacingSize.page,
            vertical: LayoutSpacingSize.page),
        child: Row(
          children: [
            HighlightIcon(
              bgColor: baseColor.withValues(alpha: 0.08),
              icon: !item.isInstragram
                  ? Icon(item.icon, color: baseColor, size: IconSizes.md)
                  : SvgPicture.asset(
                      "assets/svg/instagram.svg",
                      width: IconSizes.md,
                      height: IconSizes.md,
                      colorFilter: ColorFilter.mode(
                        baseColor,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
            const SizedBox(width: SpacingSize.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          color: context.primaryTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.8,
                          height: 1.0,
                        ),
                        // style: context.appText.headermd.copyWith(
                        //   fontWeight: FontWeight.w800,
                        //   color: context.onSurface,
                        // ),
                      ),
                      if (item.badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: SpacingSize.sm,
                            vertical: SpacingSize.xxs,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(RadiusSize.xxl),
                          ),
                          child: Text(
                            item.badge!,
                            style: context.appTextOld.caption.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: SpacingSize.xs),
                    Text(
                      item.subtitle!,
                      style: context.appTextOld.caption.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.secondaryTextColor,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            item.trailing ??
                (item.hideChevron
                    ? const SizedBox.shrink()
                    : const Icon(
                        Icons.chevron_right,
                        color: AppColors.trailing,
                      )),
          ],
        ),
      ),
    );
  }
}
