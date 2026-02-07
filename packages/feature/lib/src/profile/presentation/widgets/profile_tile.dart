import 'package:app_core/app_core.dart';
import 'package:app_feature/src/profile/presentation/profile_item.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final ProfileItem item;
  final VoidCallback? press;

  const ProfileTile({super.key, required this.item, this.press});

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
              icon: Icon(item.icon, color: baseColor, size: IconSizes.sm),
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
                        style: context.appText.bodymd.copyWith(
                          fontWeight: FontWeight.w600,
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
                            color: context.primaryColor(),
                            borderRadius: BorderRadius.circular(RadiusSize.xl),
                          ),
                          child: Text(
                            item.badge!,
                            style: context.appText.caption.copyWith(
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
                      style: context.appText.label.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.secondaryColor,
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
                        color: Color(0xFF8A96C8),
                      )),
          ],
        ),
      ),
    );
  }
}
