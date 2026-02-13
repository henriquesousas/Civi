import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String subtitle;
  final String actionTitle;
  final VoidCallback press;
  final String? title;

  const EmptyState({
    super.key,
    required this.subtitle,
    required this.actionTitle,
    required this.press,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        border: Border.all(color: AppColors.greyLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          HighlightIcon(
            containerSize: IconSizes.xxxl,
            bgColor: AppColors.greyLight,
            icon: Icon(
              Icons.search_off_outlined,
              color: context.secondaryColor,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          Text(
            title ?? 'Nada encontrado',
            style: context.appText.body.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: SpacingSize.sm),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: context.appText.bodySmall.copyWith(
              height: 1.35,
              fontWeight: FontWeight.w600,
              color: context.secondaryColor,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          TextButton(
            onPressed: press,
            child: Text(
              actionTitle,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
