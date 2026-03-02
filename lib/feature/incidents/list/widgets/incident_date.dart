import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: context.appText.caption,
        ),
      ],
    );
  }
}
