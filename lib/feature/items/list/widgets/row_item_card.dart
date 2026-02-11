import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:deehelp/core/ui/widgets/image/export_image.dart';
import 'package:deehelp/feature/items/list/item_list_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RowItemCard extends StatelessWidget {
  final UserItem item;
  final VoidCallback onTap;

  const RowItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusStyle = StatusStyle.from(item.status);
    final dateText = DateFormat('dd/MM/yyyy').format(item.createdAt);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        splashColor: context.primaryColor.withValues(alpha: 0.06),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x142B5BEE),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomNetworkImage(
                  width: ImageSize.md,
                  height: ImageSize.md,
                  radius: RadiusSize.lg,
                  imageUrl: item.photo,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.appText.bodymd.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(width: SpacingSize.sm),
                          StatusBadge(style: statusStyle),
                        ],
                      ),
                      const SizedBox(height: SpacingSize.sm),
                      Row(
                        children: [
                          HighlightIcon(
                            containerSize: IconContainerSizes.sm,
                            radius: 8,
                            bgColor: context.onSurface.withValues(alpha: 0.06),
                            icon: Icon(
                              Icons.calendar_month_outlined,
                              size: IconSizes.sm,
                              color: context.onSurface,
                            ),
                          ),
                          const SizedBox(width: SpacingSize.sm),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cadastrado em',
                                  style: context.appText.caption.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: context.secondaryColor,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  dateText,
                                  style: context.appText.bodySmall.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: context.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: context.outline.withValues(alpha: 0.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
