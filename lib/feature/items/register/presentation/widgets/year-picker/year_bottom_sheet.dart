import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YearBottomSheet extends StatelessWidget {
  final int selectedYear;
  final int min;
  const YearBottomSheet(
      {super.key, required this.selectedYear, required this.min});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().year;
    final max = now + 1;

    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
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
                borderRadius: BorderRadius.circular(RadiusSize.xxl),
              ),
            ),
            const SizedBox(height: SpacingSize.md),
            Text(
              'Selecionar ano',
              style: context.appTextOld.headermd,
            ),
            const SizedBox(height: SpacingSize.md),
            SizedBox(
              height: context.percentHeight(0.3),
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Colors.black, // cor do ano selecionado
                        onPrimary: Colors
                            .white, // cor do texto dentro do círculo selecionado
                      ),
                ),
                child: YearPicker(
                  firstDate: DateTime(min),
                  lastDate: DateTime(max),
                  selectedDate: DateTime(selectedYear),
                  onChanged: (d) => Navigator.pop(context, d.year),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//V2
class YearBottomSheetV2 extends StatelessWidget {
  final int selectedYear;
  final int min;

  const YearBottomSheetV2({
    super.key,
    required this.selectedYear,
    required this.min,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().year;
    final max = now + 1;

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
                  color: context.outlineVariantColor,
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
                          'Selecionar ano',
                          style: TextStyle(
                            fontSize: context.safeSp(16),
                            fontWeight: FontWeight.w700,
                            color: context.primaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Escolha o ano do item',
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  // color: const Color(0xFF15171B),
                  color: context.primaryBgCardHigh,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: context.primaryTextColor.withValues(alpha: 0.06),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 18.w,
                      color: context.secondaryTextColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Ano selecionado: $selectedYear',
                      style: TextStyle(
                        fontSize: context.safeSp(13),
                        fontWeight: FontWeight.w600,
                        color:
                            context.secondaryTextColor.withValues(alpha: 0.88),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: context.percentHeight(0.34),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: context.primaryColor,
                          onPrimary: Colors.white,
                          surface: const Color(0xFF0F1013),
                          onSurface: Colors.white,
                        ),
                    textTheme: Theme.of(context).textTheme.apply(
                          bodyColor: Colors.white,
                          displayColor: Colors.white,
                        ),
                  ),
                  child: YearPicker(
                    firstDate: DateTime(min),
                    lastDate: DateTime(max),
                    selectedDate: DateTime(selectedYear),
                    onChanged: (date) => Navigator.pop(context, date.year),
                  ),
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
              color: context.outline.withValues(alpha: 0.06),
            ),
          ),
          child: Icon(
            Icons.close_rounded,
            size: 20.w,
            color: context.primaryTextColor.withValues(alpha: 0.82),
          ),
        ),
      ),
    );
  }
}
