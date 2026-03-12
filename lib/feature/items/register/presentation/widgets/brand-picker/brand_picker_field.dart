import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/item_highticon.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/brand-picker/brand_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BrandPickerField extends StatelessWidget {
  // final TextEditingController controller;
  final String value;
  final List<String> options;
  final ValueChanged<String> onSelected;

  const BrandPickerField({
    super.key,
    required this.options,
    required this.onSelected,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // final value =
    //     controller.text.isEmpty ? 'Selecionar marca' : controller.text;
    final muted = value == 'Selecionar marca';

    return InkWell(
      onTap: () async {
        final picked = await showModalBottomSheet<String>(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => BrandBottomSheet(
            current: value,
            options: (options.toSet().toList()..sort()),
          ),
        );
        if (picked != null) onSelected(picked);
      },
      borderRadius: BorderRadius.circular(RadiusSize.md),
      child: Row(
        children: [
          const ItemHighticon(iconData: Icons.branding_watermark_outlined),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: SpacingSize.md, vertical: SpacingSize.md),
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
                      style: context.appText.bodySmall.copyWith(
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
