import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class DangerZone extends StatelessWidget {
  final VoidCallback onDelete;

  const DangerZone({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LayoutSpacingSize.card),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.xl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
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
              const Icon(Icons.delete_outline, color: Colors.redAccent),
              const SizedBox(width: SpacingSize.md),
              Expanded(
                child: Text(
                  'Remover item',
                  style: context.appText.body.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF8A96C8)),
            ],
          ),
        ),
      ),
    );
  }
}
