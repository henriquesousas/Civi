import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/feature/occurrence/detail/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';

class SectionDetail extends StatelessWidget {
  const SectionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.themeColor.primaryBgColor,
      padding: const EdgeInsets.symmetric(
          horizontal: SizeLayoutSpacing.m, vertical: SizeLayoutSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '6129.3 mi · 44C5+7G Azusa',
            style: context.appText.bodyLarger.copyWith(
              color: context.themeColor.secundaryTextColor,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          Text(
            'Shots Fired in Armed Standoff, Traffic Stopped on I-210',
            style: context.appText.title.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          Text(
            'Reported 12 hours ago · 72.3K notified · 103.8K views',
            style: context.appText.bodyLarger.copyWith(
              color: context.themeColor.secundaryTextColor,
            ),
          ),
          const SizedBox(height: SpacingSize.xl),
          const Row(
            spacing: 14,
            children: [
              Expanded(
                child: ActionButton(
                  text: "Compartilhar",
                  iconData: Icons.reply,
                ),
              ),
              Expanded(
                child: ActionButton(
                  text: "Seguir",
                  iconData: Icons.notifications,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
