import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/item_highticon.dart';
import 'package:flutter/material.dart';

class EditableFieldTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onEdit;
  final double? minHeight;
  final int? maxLines;

  const EditableFieldTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onEdit,
    this.minHeight,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(RadiusSize.lg),
      splashColor: context.primaryColor.withValues(alpha: 0.06),
      onTap: onEdit,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight ?? 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingSize.lg,
            vertical: SpacingSize.md,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemHighticon(iconData: icon),
              const SizedBox(width: SpacingSize.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: context.appText.caption.copyWith(
                        fontWeight: FontWeight.w800,
                        color: context.secondaryColor,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(width: SpacingSize.xs),
                    Text(
                      value.isEmpty ? 'Não informado' : value,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: context.appText.bodymd.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: SpacingSize.xs),
              HighlightIcon(
                icon: Icon(
                  Icons.edit_outlined,
                  color: context.primaryColor,
                  size: IconSizes.sm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
