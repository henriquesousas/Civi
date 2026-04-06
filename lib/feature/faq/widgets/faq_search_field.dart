import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class FaqSearhField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const FaqSearhField({
    super.key,
    required this.controller,
    required this.hint,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          // final hasFocus = Focus.of(context).hasFocus;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(RadiusSize.lg),
            // ),
            // decoration: BoxDecoration(
            //   color: const Color(0xFF101012),
            //   borderRadius: BorderRadius.circular(24),
            //   border: Border.all(color: const Color(0xFF1D1D21)),
            // ),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: context.appText.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                // fillColor: context.outlineVariantColor,
                fillColor: Colors.white,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: SpacingSize.lg),
                prefixIcon: Icon(
                  Icons.search,
                  color: context.secondaryTextColor,
                ),
                hintText: hint,
                hintStyle: TextStyle(
                  color: context.secondaryTextColor,
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (_, value, __) {
                    if (value.text.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return IconButton(
                      onPressed: onClear,
                      icon: Icon(
                        Icons.close,
                        size: IconSizes.md,
                        color: context.secondaryTextColor,
                      ),
                      splashRadius: 18,
                      tooltip: 'Limpar',
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
