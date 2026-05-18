import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
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
      style: context.appTextOld.body.copyWith(
        color: context.onSurface,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
