import 'package:app_core/src/extension/theme_color_extension.dart';
import 'package:app_core/src/theme/size/radius_size.dart';
import 'package:flutter/material.dart';

class CardHintInfo extends StatelessWidget {
  final Icon? icon;
  const CardHintInfo({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    // const _bg = Color(0xFFF5F7FD);
    // const _surface = Colors.white;

    // const _primary = Color(0xFF2157F8);
    // const _ink = Color(0xFF1F2A44);
    const _muted = Color(0xFF8A96C8);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        border: Border.all(color: context.outlineVariantColor),
        boxShadow: [
          BoxShadow(
            color: context.shadowColor,
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon(
          //   Icons.lock_outline,
          //   size: 20,
          //   color: _muted,
          // ),
          if (icon != null) ...[icon!],
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Sua localização é usada apenas para exibir informações '
              'da sua região. O Kotto não rastreia você em segundo plano.',
              style: TextStyle(
                fontSize: 13,
                height: 1.35,
                fontWeight: FontWeight.w600,
                color: _muted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
