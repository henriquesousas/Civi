import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon_gradient.dart';
import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final ItemStatus status;

  const HeaderCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final style = StatusStyle.from(status);

    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.container),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.md),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HighlightIconGradient(
            icon: Icon(
              Icons.inventory_2_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: RadiusSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.appText.headermd,
                      ),
                    ),
                    const SizedBox(width: RadiusSize.md),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(RadiusSize.xxxl),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SpacingSize.xs,
                          vertical: SpacingSize.xs,
                        ),
                        decoration: BoxDecoration(
                          color: style.bg,
                          borderRadius: BorderRadius.circular(RadiusSize.xxxl),
                          border: Border.all(color: style.border),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(style.icon,
                                size: IconSizes.sm, color: style.fg),
                            const SizedBox(width: RadiusSize.xs),
                            Text(
                              style.label,
                              style: context.appText.caption.copyWith(
                                fontWeight: FontWeight.w800,
                                color: context.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  subtitle,
                  style: context.appText.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
