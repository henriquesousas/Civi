import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/color-picker/color_bottom_sheet.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/color-picker/color_dot.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/color-picker/color_option.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/item_highticon.dart';
import 'package:flutter/material.dart';

class ColorPickerField extends StatelessWidget {
  final String value;
  final List<ColorOption> options;
  final ValueChanged<ColorOption> onSelected;

  const ColorPickerField({
    super.key,
    required this.options,
    required this.onSelected,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // final value = controller.text.isEmpty ? 'Selecionar cor' : controller.text;
    final muted = value == 'Selecionar cor';

    return InkWell(
      onTap: () async {
        final picked = await showModalBottomSheet<ColorOption>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => ColorBottomSheet(
            current: value,
            options: options,
          ),
        );
        if (picked != null) onSelected(picked);
      },
      borderRadius: BorderRadius.circular(RadiusSize.md),
      child: Row(
        children: [
          const ItemHighticon(iconData: Icons.color_lens_outlined),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: SpacingSize.md,
                vertical: SpacingSize.md,
              ),
              decoration: BoxDecoration(
                // color: const Color(0xFFF5F7FD),
                color: context.onSurfaceVariant.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(RadiusSize.md),
              ),
              child: Row(
                children: [
                  if (!muted) ...[
                    ColorDot(
                      option: options.firstWhere(
                        (o) => o.name.toLowerCase() == value.toLowerCase(),
                        orElse: () => const ColorOption('—', Color(0xFFE6EAF6)),
                      ),
                      size: 14,
                    ),
                    const SizedBox(width: SpacingSize.md),
                  ],
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color:
                            muted ? context.secondaryColor : context.onSurface,
                      ),
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
