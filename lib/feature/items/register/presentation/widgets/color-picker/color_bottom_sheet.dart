import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/color-picker/color_dot.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/color-picker/color_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorBottomSheet extends StatelessWidget {
  final String current;
  final List<ColorOption> options;

  const ColorBottomSheet({
    super.key,
    required this.current,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(RadiusSize.md)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE6EAF6),
                borderRadius: BorderRadius.circular(RadiusSize.xxxl),
              ),
            ),
            const SizedBox(height: SpacingSize.md),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Selecionar cor',
                    style: context.appText.headermd.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            const SizedBox(height: SpacingSize.md),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final opt = options[i];
                  final selected =
                      opt.name.toLowerCase() == current.toLowerCase();

                  return InkWell(
                    onTap: () => Navigator.pop(context, opt),
                    borderRadius: BorderRadius.circular(RadiusSize.md),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: LayoutSpacingSize.listItem,
                        vertical: LayoutSpacingSize.listItem,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? opt.color.withValues(alpha: 0.10)
                            : context.surfaceColor,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: selected
                              ? opt.color.withValues(alpha: 0.35)
                              : context.outlineVariantColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          ColorDot(option: opt, size: IconSizes.sm),
                          const SizedBox(width: SpacingSize.md),
                          Expanded(
                            child: Text(
                              opt.name,
                              style: context.appText.bodymd.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          if (selected)
                            Icon(Icons.check,
                                color: opt.color, size: IconSizes.md)
                          else
                            Icon(
                              Icons.chevron_right,
                              color: context.outlineVariantColor
                                  .withValues(alpha: 1),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
