import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/old_core/ui/widgets/icon/highlight_icon_gradient.dart';
import 'package:deehelp/old_core/utils/enum_utils.dart';
import 'package:flutter/cupertino.dart';
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
    // final style = StatusStyle.from(status);

    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.container),
      // decoration: BoxDecoration(
      //   color: context.surfaceColor,
      //   borderRadius: BorderRadius.circular(RadiusSize.md),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Color(0x142B5BEE),
      //       blurRadius: 16,
      //       offset: Offset(0, 8),
      //     ),
      //   ],
      // ),
      decoration: BoxDecoration(
        // color: const Color(0xFF101012),
        // color: context.primaryBgCardLow,
        color: context.primaryBgCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          // color: const Color(0xFF1D1D21),
          color: context.outlineVariantColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HighlightIconGradient(
            icon: Icon(
              CupertinoIcons.cube_box,
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
                        style: TextStyle(
                          fontSize: context.safeSp(17),
                          fontWeight: FontWeight.w800,
                          color: context.primaryTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: RadiusSize.md),
                    // StatusBadge(style: StatusStyle.from(status)),
                    StatusBadgeV2(
                        status: EnumUtils.fromString(
                            ItemStatus.values, status.name)),
                  ],
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: context.safeSp(11),
                    color: context.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
