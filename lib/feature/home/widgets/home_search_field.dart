import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class HomeSearchField extends StatelessWidget {
  final VoidCallback onTap;
  final String hint;

  const HomeSearchField({
    super.key,
    required this.onTap,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      onTap: onTap,
      child: Row(
        children: [
          HighlightIcon(
            bgColor: const Color(0xFF1F2A44).withValues(alpha: 0.05),
            icon: Icon(
              Icons.search_rounded,
              color: AppColors.grey,
              size: IconSizes.sm,
            ),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Text(
              hint,
              // style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //       color: AppColors.grey,
              //       fontWeight: FontWeight.w600,
              //     ),
            ),
          ),
          HighlightIcon(
            bgColor: context.primaryColor.withValues(alpha: 0.08),
            border:
                Border.all(color: context.primaryColor.withValues(alpha: 0.10)),
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: context.primaryColor,
              size: IconSizes.sm,
            ),
          )
        ],
      ),
    );
  }
}

//TODO: Separar
class SurfaceCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const SurfaceCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
  });

  static const shadow = BoxShadow(
    color: Color(0x12000000),
    blurRadius: 18,
    offset: Offset(0, 10),
  );

  static const shadowSoft = BoxShadow(
    color: Color(0x0D000000),
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: LayoutSpacingSize.card,
            vertical: LayoutSpacingSize.card,
          ),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(RadiusSize.xxxl),
        border: Border.all(color: context.outlineVariantColor, width: 1),
        boxShadow: const [shadowSoft],
      ),
      child: child,
    );

    if (onTap == null) return card;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: card,
    );
  }
}
