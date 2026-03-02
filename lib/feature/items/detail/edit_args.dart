import 'package:deehelp/feature/items/detail/viewmodel/item_update_manager.dart';
import 'package:flutter/services.dart';

class EditFieldArgs {
  final String title;
  final String label;
  final String hint;
  final String initialValue;
  final int? maxLen;
  final int maxLines;
  final bool toUpperCase;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String? helper;
  final bool isPhone;
  final ItemField field;

  const EditFieldArgs({
    required this.field,
    required this.title,
    required this.label,
    required this.hint,
    required this.initialValue,
    this.maxLen,
    this.isPhone = false,
    this.maxLines = 1,
    this.toUpperCase = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.helper,
  });
}
