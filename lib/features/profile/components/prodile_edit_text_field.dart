import 'package:flutter/material.dart';

class ProfileEditTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  const ProfileEditTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.label,
      required this.hint,
      this.keyboardType,
      this.validator,
      this.textInputAction,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
