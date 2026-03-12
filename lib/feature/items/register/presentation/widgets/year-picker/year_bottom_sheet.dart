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
              style: context.appText.headermd,
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
