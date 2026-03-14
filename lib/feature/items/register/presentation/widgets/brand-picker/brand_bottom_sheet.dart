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
          // decoration: BoxDecoration(
          //   color: context.surfaceColor,
          //   borderRadius: const BorderRadius.vertical(
          //       top: Radius.circular(RadiusSize.md)),
          // ),
          decoration: BoxDecoration(
            color: const Color(0xFF101012),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFF1D1D21)),
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
                        style: TextStyle(
                          fontSize: context.safeSp(16),
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // TopCircleBack(
                    //   icon: Icons.close,
                    //   onTap: () {},
                    // )
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
                          // decoration: BoxDecoration(
                          //   color: selected
                          //       ? context.primaryColor.withValues(alpha: 0.10)
                          //       : context.surfaceColor,
                          //   borderRadius: BorderRadius.circular(18),
                          // ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF101012),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: const Color(0xFF1D1D21)),
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

//V2
class BrandBottomSheetV2 extends StatefulWidget {
  final String current;
  final List<String> options;

  const BrandBottomSheetV2({
    super.key,
    required this.current,
    required this.options,
  });

  @override
  State<BrandBottomSheetV2> createState() => _BrandBottomSheetStateV2();
}

class _BrandBottomSheetStateV2 extends State<BrandBottomSheetV2> {
  final TextEditingController _searchCtrl = TextEditingController();
  String query = '';

  List<String> get _filteredOptions {
    final q = query.trim().toLowerCase();

    if (q.isEmpty) return widget.options;

    return widget.options
        .where((brand) => brand.toLowerCase().contains(q))
        .toList();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final filtered = _filteredOptions;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: keyboardHeight),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.84,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xFF0F1013),
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
            child: Column(
              children: [
                const SizedBox(height: 10),

                /// drag handle
                Container(
                  width: 42,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),

                const SizedBox(height: 18),

                /// header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selecionar marca',
                              style: TextStyle(
                                fontSize: context.safeSp(16),
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Escolha uma marca para continuar',
                              style: TextStyle(
                                fontSize: context.safeSp(12),
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.58),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CloseButtonV2(
                        onTap: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// search
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BrandSearchField(
                    controller: _searchCtrl,
                    onChanged: (value) => setState(() => query = value),
                  ),
                ),

                const SizedBox(height: 16),

                /// result count
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      filtered.isEmpty
                          ? 'Nenhuma marca encontrada'
                          : '${filtered.length} marca${filtered.length > 1 ? 's' : ''}',
                      style: TextStyle(
                        fontSize: context.safeSp(12),
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.42),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                if (filtered.isEmpty)
                  Expanded(
                    child: Align(
                      alignment: context.isLandscape
                          ? Alignment.center
                          : Alignment.topCenter,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 24),
                        child: BrandNotFound(),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (_, index) {
                        final brand = filtered[index];
                        final selected =
                            brand.toLowerCase() == widget.current.toLowerCase();

                        return _BrandTile(
                          brand: brand,
                          selected: selected,
                          onTap: () => Navigator.pop(context, brand),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandTile extends StatelessWidget {
  final String brand;
  final bool selected;
  final VoidCallback onTap;

  const _BrandTile({
    required this.brand,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = context.primaryColor;

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
                ? primary.withValues(alpha: 0.12)
                : const Color(0xFF15171B),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected
                  ? primary.withValues(alpha: 0.50)
                  : Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Row(
            children: [
              HighlightIcon(
                bgColor: selected
                    ? primary.withValues(alpha: 0.18)
                    : Colors.white.withValues(alpha: 0.04),
                icon: Icon(
                  Icons.directions_car_filled_rounded,
                  color:
                      selected ? primary : Colors.white.withValues(alpha: 0.72),
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  brand,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: context.safeSp(14),
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(
                      alpha: selected ? 1 : 0.90,
                    ),
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: selected
                    ? Container(
                        key: const ValueKey('selected'),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: primary.withValues(alpha: 0.16),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          size: 16,
                          color: primary,
                        ),
                      )
                    : Icon(
                        key: const ValueKey('arrow'),
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

class CloseButtonV2 extends StatelessWidget {
  final VoidCallback onTap;

  const CloseButtonV2({
    super.key,
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
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.04),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Icon(
            Icons.close_rounded,
            size: 20,
            color: Colors.white.withValues(alpha: 0.82),
          ),
        ),
      ),
    );
  }
}
