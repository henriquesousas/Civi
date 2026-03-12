import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/item_highticon.dart';
import 'package:flutter/material.dart';

class YearPickerField extends StatelessWidget {
  final String label;
  final String value;
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
                borderRadius: BorderRadius.circular(RadiusSize.md),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color:
                            muted ? context.secondaryColor : context.onSurface,
                      ),
                      // style: TextStyle(
                      //   fontWeight: FontWeight.w800,
                      //   color:
                      //       muted ? context.onSurface : context.secondaryColor,
                      // ),
                    ),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: context.onSurfaceVariant.withValues(alpha: 0.2),
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
