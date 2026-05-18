import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class TextFieldLongText extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;
  final int maxLen;
  final Function(String)? onChanged;

  const TextFieldLongText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.maxLen,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.primaryBgCard,
        borderRadius: BorderRadius.circular(18),
        // border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: context.appTextOld.caption.copyWith(
              fontWeight: FontWeight.w800,
              color: context.primaryTextColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: context.appTextOld.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: context.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            maxLength: maxLen,
            maxLines: 5,
            onChanged: (text) {
              if (onChanged != null) {
                onChanged!(text);
              }
            },
            decoration: InputDecoration(
              hintText: 'Digite aqui…',
              hintStyle: TextStyle(color: context.secondaryTextColor),
              filled: true,
              fillColor: context.primaryBgCardHigh.withValues(alpha: 0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
