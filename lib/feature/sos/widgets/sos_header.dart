import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

/// ===============================
class UIK {
  static const primary = Color(0xFF2B5BEE);
  static const bg = Color(0xFFF7F9FC);
  static const surface = Colors.white;
  static const ink = Color(0xFF1F2A44);
  static const muted = Color(0xFF6B7280);
  static const border = Color(0xFFE9EEF8);

  static const danger = Color(0xFFE53935);

  static const rCard = 20.0;
  static const rButton = 18.0;

  static const s12 = 12.0;
  static const s16 = 16.0;
  static const s20 = 20.0;
  static const s24 = 24.0;

  static const shadowSoft = BoxShadow(
    color: Color(0x12000000),
    blurRadius: 18,
    offset: Offset(0, 10),
  );
}

/// ========
///
class SosHeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTapTips;

  const SosHeaderCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTapTips,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.primaryColor,
        borderRadius: BorderRadius.circular(RadiusSize.sm),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F2157F8),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(UIK.s16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HighlightIcon(
            bgColor: Colors.white.withValues(alpha: 0.16),
            icon: const Icon(Icons.sos_rounded, color: Colors.white),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.appText.headermd.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: SpacingSize.sm),
                Text(
                  subtitle,
                  style: context.appText.caption.copyWith(
                    color: Colors.white.withValues(alpha: 0.88),
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
