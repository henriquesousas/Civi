import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/size/radius_size.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class EditInfoCard extends StatelessWidget {
  final String title;
  final String helper;

  const EditInfoCard({
    super.key,
    required this.title,
    required this.helper,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.white,
        color: context.secondaryContainer,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.onSurface.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(RadiusSize.md),
            ),
            child: Icon(Icons.edit_note_rounded, color: context.onSurface),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.appText.headermd.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: SpacingSize.md),
                Text(
                  helper,
                  style: context.appText.caption.copyWith(
                    color: context.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
