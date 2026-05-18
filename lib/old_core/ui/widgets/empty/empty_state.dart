import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
import 'package:deehelp/old_core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
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
      width: context.screenWidth,
      height: context.percentHeight(0.3),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: context.primaryBgCard,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        border: Border.all(color: context.outline),
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
            // bgColor: AppColors.greyLight,
            bgColor: context.surfaceColor,
            icon: Icon(
              Icons.search_off_outlined,
              color: context.secondaryTextColor,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          Text(
            title ?? 'Nada encontrado',
            style: context.appTextOld.body.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: SpacingSize.sm),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: context.appTextOld.bodySmall.copyWith(
              height: 1.35,
              fontWeight: FontWeight.w600,
              color: context.secondaryTextColor,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          ButtonOutline(
            width: context.percentWidth(0.5),
            borderColor: AppColors.primaryColor,
            press: press,
            text: "Limpar pesquisa",
          ),
          // TextButton(
          //   onPressed: press,
          //   child: Text(
          //     actionTitle,
          //     style: const TextStyle(fontWeight: FontWeight.w900),
          //   ),
          // ),
        ],
      ),
    );
  }
}
