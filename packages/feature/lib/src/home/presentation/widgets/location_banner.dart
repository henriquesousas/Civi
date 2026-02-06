import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class LocationBanner extends StatelessWidget {
  final String title;
  final String primaryText;
  final String? secondaryText;
  final VoidCallback? onTap;

  const LocationBanner({
    super.key,
    required this.title,
    required this.primaryText,
    this.secondaryText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingSize.lg,
        vertical: SpacingSize.lg,
      ),
      decoration: BoxDecoration(
        color: context.primaryColorOpacity(0.06), // ✅ não branco
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        border: Border.all(color: context.primaryColorOpacity(0.14)),
      ),
      child: Row(
        children: [
          Container(
            width: IconContainerSizes.lg,
            height: IconContainerSizes.lg,
            decoration: BoxDecoration(
              color: context.primaryColorOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.my_location_outlined,
              color: context.primaryColor(),
              size: IconSizes.sm,
            ),
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.appText.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey, // cinza elegante
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  primaryText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.appText.headersm.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (secondaryText != null) ...[
                  const SizedBox(height: SpacingSize.xs),
                  Text(
                    secondaryText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.appText.caption.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (onTap != null)
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.grey,
            ),
        ],
      ),
    );

    if (onTap == null) return content;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(RadiusSize.lg),
      child: content,
    );
  }
}
