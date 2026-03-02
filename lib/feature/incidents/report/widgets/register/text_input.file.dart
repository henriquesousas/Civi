import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:flutter/material.dart';

class TextInputTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;
  final String? error;

  const TextInputTile({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    required this.hint,
    required this.textInputAction,
    this.onChanged,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _LeadingIcon(icon: icon),
          HighlightIcon(icon: Icon(icon)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.appText.caption.copyWith(
                    fontWeight: FontWeight.w800,
                    color: context.secondaryColor,
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: controller,
                  textInputAction: textInputAction,
                  onChanged: (text) {
                    if (onChanged != null) {
                      onChanged!(text);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: hint,
                    errorText: error,
                    hintStyle: TextStyle(color: context.secondaryColor),
                    filled: true,
                    fillColor: const Color(0xFFF5F7FD),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
