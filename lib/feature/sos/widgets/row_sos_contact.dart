import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/size/layout_spacing_size.dart';
import 'package:deehelp/core/theme/size/radius_size.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
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
      color: context.surfaceColor,
      borderRadius: radius,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: InkWell(
        onTap: onCall,
        child: Ink(
          decoration: BoxDecoration(
            color: context.surfaceColor,
            borderRadius: radius,
            border: Border.all(color: context.outlineVariantColor),
            boxShadow: const [AppColors.shadowSoft],
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
                      style: context.appText.headermd,
                    ),
                    const SizedBox(height: SpacingSize.xs),
                    Text(
                      contact.subtitle,
                      style: context.appText.caption.copyWith(
                        color: context.secondaryColor,
                      ),
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
