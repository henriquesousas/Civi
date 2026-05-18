import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:flutter/material.dart';

class ProfileStateItem extends StatelessWidget {
  final String value;
  final String label;
  const ProfileStateItem({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Text(
          value,
          style: context.appText.title.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}
