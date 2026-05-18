import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
import 'package:deehelp/old_core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? asset;
  final bool selected;
  final VoidCallback onTap;

  const TypeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
    this.asset,
  });

  @override
  Widget build(BuildContext context) {
    // final border = selected ? context.primaryColor : const Color(0xFFE6EAF6);
    final border =
        selected ? context.primaryColor : context.outlineVariantColor;
    final bg = selected
        ? context.primaryColor.withValues(alpha: 0.07)
        : context.primaryBgCard;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(RadiusSize.xl),
      child: Container(
        padding: const EdgeInsets.all(LayoutSpacingSize.container),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(RadiusSize.xl),
          border: Border.all(color: border, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        // decoration: BoxDecoration(
        //   color: const Color(0xFF101012),
        //   borderRadius: BorderRadius.circular(24),
        //   border: Border.all(color: const Color(0xFF1D1D21)),
        // ),
        child: Row(
          children: [
            // HighlightIcon(
            //   bgColor: selected
            //       ? context.primaryColor.withValues(alpha: 0.8)
            //       : context.primaryBgCardHigh.withValues(alpha: 0.4),
            //   // : const Color(0xFFF5F7FD),
            //   icon: Icon(
            //     icon,
            //     // color: selected ? context.primaryColor : context.onSurface,
            //     color: selected ? Colors.white : context.onSurface,
            //   ),
            //   // icon: Image.asset(
            //   //   asset!,
            //   // ),
            // ),
            CiviImageCard(
              assetPath: asset!,
              width: 50.w,
              height: 50.h,
            ),
            const SizedBox(width: SpacingSize.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.appTextOld.headermd.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: SpacingSize.xs),
                  Text(
                    subtitle,
                    style: context.appTextOld.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.circle_outlined,
              color: selected ? context.primaryColor : const Color(0xFF8A96C8),
            ),
          ],
        ),
      ),
    );
  }
}
