import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderSummary extends StatelessWidget {
  final int total;

  const HeaderSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.card),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(RadiusSize.xl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.push(ItemsRouter.register),
            child: Container(
              width: IconSizes.xxl,
              height: IconSizes.xxl,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                gradient: LinearGradient(
                  colors: [
                    // Color(0xFF2B5BEE),
                    // Color(0xFF5F85FF),
                    context.primaryColor,
                    context.primaryColorDark,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(Icons.add, color: context.surfaceColor),
            ),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seus itens cadastrados',
                  style: context.appText.headermd.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: SpacingSize.xs),
                Text(
                  '$total item(ns) no seu perfil',
                  style: context.appText.caption.copyWith(
                    color: context.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: context.primaryColor.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(RadiusSize.xxxl),
            ),
            child: Text(
              '$total',
              style: context.appText.caption.copyWith(
                fontWeight: FontWeight.w800,
                color: context.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
