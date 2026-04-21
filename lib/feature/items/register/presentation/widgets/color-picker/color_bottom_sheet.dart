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
                    style: context.appTextOld.headermd.copyWith(
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
                              style: context.appTextOld.bodymd.copyWith(
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

//V2

class ColorBottomSheetV2 extends StatelessWidget {
  final String current;
  final List<ColorOption> options;

  const ColorBottomSheetV2({
    super.key,
    required this.current,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        // color: const Color(0xFF0F1013),
        color: context.primaryBgCardLow,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28),
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.30),
            blurRadius: 28,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: context.outline,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selecionar cor',
                          style: TextStyle(
                            fontSize: context.safeSp(18),
                            fontWeight: FontWeight.w700,
                            color: context.primaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Escolha a cor que melhor representa o item',
                          style: TextStyle(
                            fontSize: context.safeSp(12),
                            fontWeight: FontWeight.w500,
                            color: context.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _CloseButton(
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${options.length} cor${options.length > 1 ? 'es' : ''}',
                  style: TextStyle(
                    fontSize: context.safeSp(12),
                    fontWeight: FontWeight.w600,
                    color: context.primaryTextColor.withValues(alpha: 0.42),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: options.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) {
                    final opt = options[i];
                    final selected =
                        opt.name.toLowerCase() == current.toLowerCase();

                    return _ColorTile(
                      option: opt,
                      selected: selected,
                      onTap: () => Navigator.pop(context, opt),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorTile extends StatelessWidget {
  final ColorOption option;
  final bool selected;
  final VoidCallback onTap;

  const _ColorTile({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accent = option.color;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: selected
                ? accent.withValues(alpha: 0.12)
                : context.primaryBgCard,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected
                  ? accent.withValues(alpha: 0.45)
                  : context.primaryBgCard.withValues(alpha: 0.06),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: selected
                      ? accent.withValues(alpha: 0.12)
                      : Colors.white.withValues(alpha: 0.03),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected
                        ? context.outline.withValues(alpha: 0.30)
                        : context.outlineVariantColor.withValues(alpha: 0.05),
                  ),
                ),
                child: Center(
                  child: ColorDot(
                    option: option,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: context.safeSp(14),
                    fontWeight: FontWeight.w600,
                    color: context.primaryTextColor.withValues(
                      alpha: selected ? 1 : 0.90,
                    ),
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: selected
                    ? Container(
                        key: ValueKey('selected_${option.name}'),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        key: ValueKey('arrow_${option.name}'),
                        Icons.chevron_right_rounded,
                        color: Colors.white.withValues(alpha: 0.26),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CloseButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: context.outlineVariantColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Icon(
            Icons.close_rounded,
            size: 20,
            color: context.primaryTextColor,
          ),
        ),
      ),
    );
  }
}
