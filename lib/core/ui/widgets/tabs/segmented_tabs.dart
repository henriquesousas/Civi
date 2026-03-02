import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class SegmentedTabs extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  final List<String> items;

  const SegmentedTabs({
    super.key,
    required this.index,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SpacingSize.sm),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.md),
        border: Border.all(color: context.outlineVariantColor),
      ),
      child: Row(
        children: List.generate(items.length, (i) {
          final selected = i == index;
          return Expanded(
            child: InkWell(
              onTap: () => onChanged(i),
              borderRadius: BorderRadius.circular(RadiusSize.md),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(vertical: SpacingSize.md),
                decoration: BoxDecoration(
                  color: selected
                      ? context.primaryColor.withValues(alpha: 0.10)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(RadiusSize.md),
                  border: Border.all(
                    color: selected
                        ? context.primaryColor.withValues(alpha: 0.20)
                        : Colors.transparent,
                  ),
                ),
                child: Center(
                  child: Text(
                    items[i],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.appText.bodySmall.copyWith(
                      color:
                          selected ? context.onSurface : context.secondaryColor,
                      fontWeight: selected ? FontWeight.w900 : FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
