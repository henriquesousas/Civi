import 'package:deehelp/core/theme/size/radius_size.dart';
import 'package:deehelp/core/ui/widgets/textfield/text_field_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCard extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Function(String)? onChanged;
  final String? error;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? formatters;
  const TextFieldCard({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.error,
    this.formatters,
    this.maxLength,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: TextFieldPrimary(
        hint: hint,
        controller: controller,
        onChanged: onChanged,
        error: error,
        inputFormatters: formatters,
        maxLength: maxLength,
        maxLines: maxLines,
      ),
    );
  }
}
