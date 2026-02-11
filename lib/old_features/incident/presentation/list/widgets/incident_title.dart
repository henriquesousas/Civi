import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class IncidentTitle extends StatelessWidget {
  final String title;
  const IncidentTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.appTextStyles.sectionTitle.copyWith(
        // fontWeight: FontWeight.w700,
        // color: AppColors.textColorBody,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
