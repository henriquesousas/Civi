import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class UIDot extends StatelessWidget {
  const UIDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: context.appColor.primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
