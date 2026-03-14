import 'package:deehelp/core/theme/export_theme.dart';
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
        color: const Color(0xFF151010),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF3A1E22)),
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
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFEF4444),
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                color: const Color(0xFF8D8D93),
                size: IconSizes.xs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
