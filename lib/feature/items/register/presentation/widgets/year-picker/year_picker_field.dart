import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/item_highticon.dart';
import 'package:flutter/material.dart';

class YearPickerField extends StatelessWidget {
  final String label;
  final String? value;
  final IconData icon;
  final VoidCallback onTap;

  const YearPickerField({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final muted = value == 'Selecionar ano';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Row(
        children: [
          ItemHighticon(iconData: icon),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutSpacingSize.container,
                vertical: LayoutSpacingSize.container,
              ),
              decoration: BoxDecoration(
                // color: const Color(0xFFF5F7FD),
                color: context.onSurfaceVariant.withValues(alpha: 0.03),
                // color: context.primaryBgCardLow,
                borderRadius: BorderRadius.circular(RadiusSize.md),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value ?? 'Selecionar ano',
                      style: TextStyle(
                        fontWeight:
                            value == null ? FontWeight.w600 : FontWeight.bold,
                        color: muted
                            ? context.secondaryTextColor
                            : value == null
                                ? context.secondaryTextColor
                                : context.primaryTextColor,
                      ),
                      // style: TextStyle(
                      //   fontWeight: FontWeight.w800,
                      //   color:
                      //       muted ? context.onSurface : context.secondaryColor,
                      // ),
                    ),
                  ),
                  const Icon(
                    Icons.expand_more,
                    color: AppColors.trailing,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
