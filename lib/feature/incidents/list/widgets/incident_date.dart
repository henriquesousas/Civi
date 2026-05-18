import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
import 'package:deehelp/old_core/extension/date_extension.dart';
import 'package:flutter/material.dart';

class IncidentDate extends StatelessWidget {
  final DateTime occurreAt;
  const IncidentDate({super.key, required this.occurreAt});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: IconSizes.xxs,
          color: context.onSurface,
        ),
        Text(
          occurreAt.toDateWithFullMonth(),
          style: context.appTextOld.caption,
        ),
      ],
    );
  }
}
