import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/views/listing/widgets/status_badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/ui/theme/app_colors.dart';

class ProductListTileCard extends StatelessWidget {
  final Product product;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double width;
  final VoidCallback? onPressed;
  final bool isPress;

  const ProductListTileCard({
    super.key,
    required this.product,
    this.width = double.infinity,
    this.onPressed,
    this.isPress = false,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 5),
      // borderColor: AppColors.greyColor,
      borderColor: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
      radius: 9,
      borderWidth: 1,
      padding: EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed != null
              ? () {
                  HapticFeedback.lightImpact();
                  onPressed!();
                }
              : null,
          borderRadius: BorderRadius.circular(12),
          splashColor: AppColors.primaryColor.withValues(alpha: 0.1),
          highlightColor: AppColors.primaryColor.withValues(alpha: 0.05),
          child: Container(
            padding: padding ?? const EdgeInsets.all(16),
            child: Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // UIMyNetworkImageWidget(
                //   imageUrl: product.image?.value ?? '',
                //   width: 60,
                //   height: 60,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.sectionTitle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      product.code,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.caption1Style.copyWith(
                        // color: AppColors.textSecondary,
                        color: Theme.of(context).colorScheme.surfaceDim,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 1,
                  height: Dimens.size40.h,
                  color: AppColors.lightGreyColor20,
                ),
                StatusBadgeWidget(
                  label: product.status.label,
                  color: product.status.color,
                  iconData: product.status.icon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
