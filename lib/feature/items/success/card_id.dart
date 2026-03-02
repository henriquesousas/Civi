import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardId extends StatelessWidget {
  final String itemId;
  const CardId({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingSize.md,
        vertical: SpacingSize.md,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(RadiusSize.md),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Row(
        children: [
          Icon(Icons.fingerprint_outlined,
              color: Colors.white, size: IconSizes.sm),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Text(
              'ID do item: $itemId',
              style: context.appText.bodySmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(99),
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: itemId));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ID copiado!')),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: SpacingSize.sm,
                vertical: SpacingSize.xs,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(RadiusSize.xxl),
                border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
              ),
              child: Text(
                'Copiar',
                style: context.appText.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
