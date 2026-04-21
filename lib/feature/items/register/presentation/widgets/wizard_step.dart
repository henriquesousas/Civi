import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/core/ui/widgets/cards/surface_card.dart';
import 'package:flutter/material.dart';

class WizardHeader extends StatelessWidget {
  final int step;
  final String title;
  final String subtitle;

  const WizardHeader({
    super.key,
    required this.step,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(LayoutSpacingSize.page),
        child: Row(
          children: [
            CardCounter(counter: (step + 1)),
            const SizedBox(width: SpacingSize.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.appTextOld.body.copyWith(
                        fontWeight: FontWeight.w900,
                        color: context.primaryTextColor),
                  ),
                  const SizedBox(height: SpacingSize.xs),
                  Text(
                    subtitle,
                    style: context.appTextOld.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
