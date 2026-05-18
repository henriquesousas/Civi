import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/extension/size_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:deehelp/old_core/ui/widgets/buttons/button_outline.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchEmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onAction;

  const SearchEmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            HighlightIcon(
              containerSize: IconContainerSizes.lg.w,
              bgColor: context.primaryColor.withValues(alpha: 0.10),
              icon: Icon(Icons.search_off_outlined,
                  color: context.primaryColor, size: IconSizes.lg),
            ),
            const SizedBox(height: SpacingSize.md),
            Text(
              title,
              style: context.appTextOld.headermd,
            ),
            const SizedBox(height: SpacingSize.sm),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: context.appTextOld.bodySmall.copyWith(
                height: 1.35,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: SpacingSize.md),
            ButtonOutline(
              width: context.percentWidth(0.5),
              icon: Icon(
                Icons.history_rounded,
                color: context.onSurfaceVariant,
              ),
              text: actionLabel,
              press: onAction,
            )
          ],
        ),
      ),
    );
  }
}
