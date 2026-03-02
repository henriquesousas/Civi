import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class HeaderSummary extends StatelessWidget {
  final int total;

  const HeaderSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.card),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Container(
            width: IconSizes.xxl,
            height: IconSizes.xxl,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusSize.md),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2B5BEE),
                  Color(0xFF5F85FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(Icons.inventory_2_outlined, color: Colors.white),
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
