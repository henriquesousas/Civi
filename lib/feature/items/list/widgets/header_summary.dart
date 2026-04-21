import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderSummary extends StatefulWidget {
  final int total;

  const HeaderSummary({super.key, required this.total});

  @override
  State<HeaderSummary> createState() => _HeaderSummaryState();
}

class _HeaderSummaryState extends State<HeaderSummary> {
  final bool _isHovered = false;
  bool _isPressed = false;

  void _handleTap(BuildContext context) {
    context.push(ItemsRouter.register);
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(RadiusSize.xs);

    return AnimatedScale(
      duration: const Duration(milliseconds: 120),
      scale: _isPressed ? 0.985 : 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: context.primaryBgCard,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: _isHovered ? 0.14 : 0.08,
              ),
              blurRadius: _isHovered ? 22 : 14,
              offset: Offset(0, _isHovered ? 10 : 6),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: borderRadius,
          splashColor: context.primaryColor.withValues(alpha: 0.10),
          highlightColor: context.primaryColor.withValues(alpha: 0.04),
          onTap: () => _handleTap(context),
          onHighlightChanged: (value) {
            setState(() => _isPressed = value);
          },
          child: Padding(
            padding: const EdgeInsets.all(LayoutSpacingSize.card),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: IconSizes.xxl,
                  height: IconSizes.xxl,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.primaryColorDark,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: context.primaryColor.withValues(
                          alpha: _isHovered ? 0.30 : 0.18,
                        ),
                        blurRadius: _isHovered ? 16 : 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: SpacingSize.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adicionar novo item',
                        style: context.appTextOld.headermd.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.primaryTextColor,
                        ),
                      ),
                      const SizedBox(height: SpacingSize.xs),
                      Text(
                        '${widget.total} item(ns) no seu perfil',
                        style: context.appTextOld.caption.copyWith(
                          color: context.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: context.primaryColor.withValues(
                      alpha: _isHovered ? 0.16 : 0.10,
                    ),
                    borderRadius: BorderRadius.circular(RadiusSize.xxxl),
                  ),
                  child: Text(
                    '${widget.total}',
                    style: context.appTextOld.caption.copyWith(
                      fontWeight: FontWeight.w800,
                      color: context.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
