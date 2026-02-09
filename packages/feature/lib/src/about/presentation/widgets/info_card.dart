import 'package:app_core/app_core.dart';
import 'package:app_feature/src/about/presentation/widgets/about_card.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const InfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AboutCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HighlightIcon(
                  bgColor: context.onSurface.withValues(alpha: 0.08),
                  icon: Icon(
                    icon,
                    color: context.onSurface,
                    size: IconSizes.md,
                  ),
                ),
                const SizedBox(width: SpacingSize.md),
                Expanded(
                  child: Text(
                    title,
                    style: context.appText.body.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: context.onSurface.withValues(alpha: 0.5),
                ),
              ],
            ),
            const SizedBox(width: SpacingSize.md),
            child,
          ],
        ),
      ),
    );
  }
}
