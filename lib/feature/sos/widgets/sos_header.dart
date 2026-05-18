import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class SosHeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTapTips;

  const SosHeaderCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTapTips,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: context.primaryColor,
      //   borderRadius: BorderRadius.circular(RadiusSize.sm),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Color(0x1F2157F8),
      //       blurRadius: 18,
      //       offset: Offset(0, 10),
      //     ),
      //   ],
      // ),
      decoration: BoxDecoration(
        // color: const Color(0xFF101012),
        color: context.primaryBgCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: context.outline),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HighlightIcon(
            // bgColor: Colors.white.withValues(alpha: 0.16),
            bgColor: context.primaryBgCardHigh,
            icon: const Icon(Icons.sos_rounded, color: Colors.white),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.appTextOld.headermd,
                ),
                const SizedBox(height: SpacingSize.sm),
                Text(
                  subtitle,
                  style: context.appTextOld.caption.copyWith(
                    // color: Colors.white.withValues(alpha: 0.88),
                    fontWeight: FontWeight.w600,
                    height: 1.25,
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
