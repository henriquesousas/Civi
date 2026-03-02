import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/brand-picker/brand_not_found.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/brand-picker/brand_search_field.dart';
import 'package:flutter/material.dart';

class BrandBottomSheet extends StatefulWidget {
  final String current;
  final List<String> options;

  const BrandBottomSheet({
    super.key,
    required this.current,
    required this.options,
  });

  @override
  State<BrandBottomSheet> createState() => _BrandBottomSheetState();
}

class _BrandBottomSheetState extends State<BrandBottomSheet> {
  final _searchCtrl = TextEditingController();
  String query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = widget.options.where((b) {
      if (query.trim().isEmpty) return true;
      return b.toLowerCase().contains(query.toLowerCase());
    }).toList();

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: keyboardHeight),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(RadiusSize.md)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 12),

              /// drag handle
              Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EAF6),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),

              const SizedBox(height: 16),

              /// header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Selecionar marca',
                        style: context.appText.headermd.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Fechar',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              /// search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BrandSearchField(
                  controller: _searchCtrl,
                  onChanged: (v) => setState(() => query = v),
                ),
              ),

              const SizedBox(height: 16),

              /// list
              if (filtered.isEmpty) ...[
                Expanded(
                  child: Align(
                    alignment: context.isLandscape
                        ? Alignment.center
                        : Alignment.topCenter,
                    child: const BrandNotFound(),
                  ),
                ),
              ] else
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) {
                      final brand = filtered[i];
                      final selected =
                          brand.toLowerCase() == widget.current.toLowerCase();

                      return InkWell(
                        onTap: () => Navigator.pop(context, brand),
                        borderRadius: BorderRadius.circular(RadiusSize.md),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: LayoutSpacingSize.card,
                            vertical: LayoutSpacingSize.card,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? context.primaryColor.withValues(alpha: 0.10)
                                : const Color(0xFFF5F7FD),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              HighlightIcon(
                                bgColor: context.primaryColor
                                    .withValues(alpha: 0.10),
                                icon: Icon(
                                  Icons.directions_car_filled_outlined,
                                  color: context.primaryColor,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(width: SpacingSize.md),
                              Expanded(
                                child: Text(
                                  brand,
                                  style: context.appText.headersm,
                                ),
                              ),
                              if (selected)
                                Icon(
                                  Icons.check,
                                  color: context.primaryColor,
                                )
                              else
                                Icon(
                                  Icons.chevron_right,
                                  color: context.outline.withValues(alpha: 0.5),
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
      ),
    );
  }
}
