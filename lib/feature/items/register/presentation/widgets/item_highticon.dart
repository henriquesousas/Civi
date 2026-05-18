import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class ItemHighticon extends StatelessWidget {
  final IconData iconData;
  const ItemHighticon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return HighlightIcon(
      bgColor: context.onSurface.withValues(alpha: 0.08),
      icon: Icon(
        iconData,
        color: context.onSurface,
        size: IconSizes.md,
      ),
    );
  }
}
