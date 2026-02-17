import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/brand-picker/brand_not_found.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/brand-picker/brand_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    final filtered = widget.options.where((b) {
      if (query.trim().isEmpty) return true;
      return b.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(RadiusSize.md)),
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
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: SpacingSize.md),
              Row(
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
              const SizedBox(height: SpacingSize.md),
              BrandSearchField(
                controller: _searchCtrl,
                onChanged: (v) => setState(() => query = v),
              ),
              const SizedBox(height: SpacingSize.md),
              Flexible(
                child: filtered.isEmpty
                    ? const BrandNotFound()
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (_, i) {
                          final brand = filtered[i];
                          final selected = brand.toLowerCase() ==
                              widget.current.toLowerCase();

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
                                    ? context.primaryColor
                                        .withValues(alpha: 0.10)
                                    : const Color(0xFFF5F7FD),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: selected
                                      ? context.primaryColor
                                          .withValues(alpha: 0.35)
                                      : const Color(0xFFE6EAF6),
                                ),
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
                                      size: IconSizes.md,
                                    )
                                  else
                                    Icon(
                                      Icons.chevron_right,
                                      color: context.outline
                                          .withValues(alpha: 0.5),
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
