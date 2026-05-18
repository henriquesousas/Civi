import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/item_highticon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditableFieldTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onEdit;
  final double? minHeight;
  final int? maxLines;
  final bool isLoading;
  final Color? textColor;

  const EditableFieldTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.onEdit,
    this.minHeight,
    this.maxLines,
    this.isLoading = false,
    this.textColor,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemHighticon(iconData: icon),
              const SizedBox(width: SpacingSize.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: context.safeSp(11),
                        fontWeight: FontWeight.w800,
                        // color: const Color(0xFF8D8D93),
                        color: context.primaryTextColor,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(width: SpacingSize.xs),
                    Text(
                      value.isEmpty ? 'Não informado' : value,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: context.safeSp(13),
                        fontWeight: FontWeight.w500,
                        color: context.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: SpacingSize.xs),
              if (onEdit != null) ...[
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: SpacingSize.md),
                    child: SizedBox(
                      width: SpacingSize.lg,
                      height: SpacingSize.lg,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (!isLoading)
                  HighlightIcon(
                    // bgColor: Colors.white.withValues(alpha: 0.05),
                    bgColor: context.primaryBgCardLow,
                    icon: Icon(
                      CupertinoIcons.pencil,
                      // color: context.primaryColor,
                      color: AppColors.primaryColor,
                      // color: const Color(0xFF8F98FF),
                      size: IconSizes.sm,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
