import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:deehelp/core/ui/widgets/image/export_image.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/list/widgets/phone_placeholder.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/core/extension/date_extension.dart';
import 'package:flutter/material.dart';

class RowItemCard extends StatelessWidget {
  final Product item;
  final VoidCallback onTap;

  const RowItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusStyle = StatusStyle.from(item.status);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: context.primaryColor.withValues(alpha: 0.06),
        child: Ink(
          decoration: BoxDecoration(
            color: context.surfaceColor,
            borderRadius: BorderRadius.circular(12),
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
                // if (item.type != ItemType.phone.name) ...[
                // CustomNetworkImage(
                //   width: ImageSize.md,
                //   height: ImageSize.md,
                //   radius: RadiusSize.lg,
                //   imageUrl:
                //       item.images.isNotEmpty ? item.images[0].value : '',
                //   customErrorWidget: Icon(
                //     Icons.phone_android,
                //     size: IconSizes.xl,
                //     color: context.onSurface.withValues(alpha: 0.5),
                //   ),
                // ),
                // ],
                // if (item.type == ItemType.phone.name) ...[
                //   PhonePlaceholder(
                //     size: ImageSize.md,
                //   )
                // ],
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
                                  item.createdAt!.toDayMonthYearFormat(),
                                  style: context.appText.bodySmall.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: context.secondaryColor,
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
