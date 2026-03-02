import 'package:flutter/material.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/size/layout_spacing_size.dart';
import 'package:deehelp/core/theme/size/radius_size.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';

class QuickActionsCard extends StatelessWidget {
  final VoidCallback onMyItems;
  final VoidCallback onMyIncidents;
  final VoidCallback onSOS;
  final VoidCallback onSearch;

  const QuickActionsCard({
    super.key,
    required this.onMyItems,
    required this.onMyIncidents,
    required this.onSOS,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(RadiusSize.lg);

    return Material(
      color: context.surfaceColor,
      borderRadius: radius,
      elevation: 0,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(color: context.outlineVariantColor),
          boxShadow: const [AppColors.shadowSoft],
        ),
        padding: const EdgeInsets.all(LayoutSpacingSize.container),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ações rápidas',
              style: context.appText.headerlg,
            ),
            const SizedBox(height: SpacingSize.lg),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: SpacingSize.md,
              crossAxisSpacing: SpacingSize.md,
              childAspectRatio: 1.6,
              children: [
                _QuickActionItem(
                  icon: Icons.inventory_2_rounded,
                  label: 'Meus itens',
                  onTap: onMyItems,
                ),
                _QuickActionItem(
                  icon: Icons.assignment_rounded,
                  label: 'Ocorrências',
                  onTap: onMyIncidents,
                ),
                _QuickActionItem(
                  icon: Icons.sos_rounded,
                  label: 'SOS',
                  onTap: onSOS,
                  isDanger: true,
                ),
                _QuickActionItem(
                  icon: Icons.search_rounded,
                  label: 'Pesquisar',
                  onTap: onSearch,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDanger;

  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(RadiusSize.md);
    final accent = isDanger ? Colors.red : AppColors.primaryColor;

    return Material(
      color: accent.withValues(alpha: 0.06),
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        splashColor: accent.withValues(alpha: 0.2),
        highlightColor: accent.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.all(SpacingSize.md),
          child: Row(
            children: [
              Icon(icon, color: accent),
              const SizedBox(width: SpacingSize.sm),
              Expanded(
                child: Text(
                  label,
                  style: context.appText.body.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
