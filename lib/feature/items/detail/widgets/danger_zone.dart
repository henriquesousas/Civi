import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DangerZone extends StatelessWidget {
  final VoidCallback onDelete;

  const DangerZone({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.card),
      decoration: BoxDecoration(
        color: AppColors.danger.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          // color: const Color(0xFF3A1E22),
          color: AppColors.danger.withValues(alpha: 0.2),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(RadiusSize.md),
        onTap: onDelete,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutSpacingSize.card,
            vertical: LayoutSpacingSize.card,
          ),
          child: Row(
            children: [
              // const Icon(Icons.delete_outline, color: Colors.redAccent),
              const Icon(CupertinoIcons.trash, color: Color(0xFFEF4444)),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Remover item',
                  style: TextStyle(
                    // fontSize: context.safeSp(15),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEF4444),
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                color: AppColors.danger,
                size: IconSizes.xs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
