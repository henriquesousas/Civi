import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_outline.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final Icon highlightIcon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onRegisterItem;

  const EmptyStateWidget({
    super.key,
    required this.onRegisterItem,
    required this.highlightIcon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HighlightIcon(
              radius: RadiusSize.xl,
              containerSize: ImageSize.md,
              icon: highlightIcon,
            ),
            const SizedBox(height: SpacingSize.lg),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.appText.bodymd.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: SpacingSize.md),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: context.appText.bodySmall.copyWith(
                color: context.secondaryColor,
              ),
            ),
            const SizedBox(height: SpacingSize.xl),
            ButtonOutline(
              bgColor: context.primaryColor,
              press: onRegisterItem,
              text: buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
