import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const ActionTile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Icon(
          icon,
          size: SizeIcon.m,
          color: context.appColor.surfaceVariant,
        ),
        Text(
          title,
          style: context.appText.caption.copyWith(
            color: context.appColor.surfaceVariant,
          ),
        ),
      ],
    );
  }
}
