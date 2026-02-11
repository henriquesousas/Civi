import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/feature/items/register/widgets/color-picker/color_bottom_sheet.dart';
import 'package:deehelp/feature/items/register/widgets/color-picker/color_dot.dart';
import 'package:deehelp/feature/items/register/widgets/color-picker/color_option.dart';
import 'package:deehelp/feature/items/register/widgets/item_highticon.dart';
import 'package:flutter/material.dart';

class ColorPickerField extends StatelessWidget {
  final TextEditingController controller;
  final List<ColorOption> options;
  final ValueChanged<ColorOption> onSelected;

  const ColorPickerField({
    super.key,
    required this.controller,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final value = controller.text.isEmpty ? 'Selecionar cor' : controller.text;

    return InkWell(
      onTap: () async {
        final picked = await showModalBottomSheet<ColorOption>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => ColorBottomSheet(
            current: controller.text,
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
                color: const Color(0xFFF5F7FD),
                borderRadius: BorderRadius.circular(RadiusSize.md),
              ),
              child: Row(
                children: [
                  if (controller.text.isNotEmpty) ...[
                    ColorDot(
                      option: options.firstWhere(
                        (o) =>
                            o.name.toLowerCase() ==
                            controller.text.toLowerCase(),
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
                        color: controller.text.isEmpty
                            ? context.secondaryColor
                            : context.onSurface,
                      ),
                    ),
                  ),
                  const Icon(Icons.expand_more, color: Color(0xFF8A96C8)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
