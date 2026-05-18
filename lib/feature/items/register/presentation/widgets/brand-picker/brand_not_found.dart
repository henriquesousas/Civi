import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/size/layout_spacing_size.dart';
import 'package:deehelp/old_core/theme/size/radius_size.dart';
import 'package:flutter/material.dart';

class BrandNotFound extends StatelessWidget {
  const BrandNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.container),
      decoration: BoxDecoration(
        // color: const Color(0xFFF5F7FD),
        // color: context.outline,
        borderRadius: BorderRadius.circular(RadiusSize.md),
        border: Border.all(
          color: context.outlineVariantColor,
        ),
      ),
      child: Text(
        'Nenhuma marca encontrada.',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: context.secondaryTextColor,
        ),
      ),
    );
  }
}
