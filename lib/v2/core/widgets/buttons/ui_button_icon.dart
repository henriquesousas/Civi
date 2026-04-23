import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:flutter/material.dart';

class UIButtonIcon extends StatelessWidget {
  final VoidCallback tap;
  final String title;
  final Icon icon;
  const UIButtonIcon(
      {super.key, required this.tap, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: tap,
        icon: icon,
        label: Text(
          title,
          style: context.appText.button.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Color(0xFF22314D),
          ),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
    );
  }
}
