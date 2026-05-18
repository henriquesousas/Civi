import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/app_colors.dart';
import 'package:deehelp/old_core/theme/size/layout_spacing_size.dart';
import 'package:deehelp/old_core/theme/size/radius_size.dart';
import 'package:deehelp/old_core/theme/size/spacing_size.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/feature/sos/widgets/sos_contact.dart';
import 'package:flutter/material.dart';

class RowSOSContact extends StatelessWidget {
  final SosContact contact;
  final VoidCallback onCall;

  const RowSOSContact({
    super.key,
    required this.contact,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    final accent = contact.accentColor;
    final radius = BorderRadius.circular(RadiusSize.lg);

    return Material(
      // color: context.primaryBgCard,
      color: context.primaryBgCard,

      borderRadius: radius,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      // shadowColor: const Color(0x142B5BEE),
      // boxShadow: const [
      //   BoxShadow(
      //     color: Color(0x142B5BEE),
      //     blurRadius: 16,
      //     offset: Offset(0, 8),
      //   ),
      // ],
      child: InkWell(
        onTap: onCall,
        child: Ink(
          // decoration: BoxDecoration(
          //   color: context.surfaceColor,
          //   borderRadius: radius,
          //   border: Border.all(color: context.outlineVariantColor),
          //   boxShadow: const [AppColors.shadowSoft],
          // ),
          decoration: BoxDecoration(
            // color: const Color(0xFF101012),
            color: context.primaryBgCard,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: context.outlineVariantColor),
          ),
          padding: const EdgeInsets.all(LayoutSpacingSize.container),
          child: Row(
            children: [
              HighlightIcon(
                bgColor: accent.withValues(alpha: 0.12),
                icon: Icon(contact.icon, color: accent),
              ),
              const SizedBox(width: SpacingSize.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.title,
                      style: context.appTextOld.headermd,
                    ),
                    const SizedBox(height: SpacingSize.xs),
                    Text(
                      contact.subtitle,
                      style: context.appTextOld.caption,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: SpacingSize.md),
              Icon(
                Icons.phone,
                color: AppColors.primaryColor.withValues(alpha: 0.9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
