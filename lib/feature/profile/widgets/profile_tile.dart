import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/feature/profile/profile_item.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../old_core/ui/widgets/icon/export_icon.dart';

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
                        style: context.appText.subtitle.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 1.0,
                        ),
                      ),
                      if (item.badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: SpacingSize.sm,
                            vertical: SpacingSize.xxs,
                          ),
                          decoration: BoxDecoration(
                            // color: AppColors.primaryColor,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(RadiusSize.xxl),
                          ),
                          child: Text(
                            item.badge!,
                            style: context.appText.caption.copyWith(
                              color: Colors.black,
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
                      style: context.appText.caption.copyWith(
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
                    : Icon(
                        Icons.chevron_right,
                        color: context.themeColor.secundaryTextColor,
                        // color: Color(0xFFE7EDE1),
                      )),
          ],
        ),
      ),
    );
  }
}
