import 'package:deehelp/core/components/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/product/domain/entities/product.dart';
import 'package:deehelp/features/product/presentation/listing/components/status_badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/theme/app_colors.dart';

class MyProductsListTileCard extends StatelessWidget {
  final Product product;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double width;
  final VoidCallback? onPressed;
  final bool isPress;

  const MyProductsListTileCard({
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
                ProfileImageWithUploadButtonWidget(
                  imageUrl: product.image?.value ?? '',
                  imageAlt: "Imagem do veiculo",
                  showUploadIcon: true,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.sectionTitle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColorBody,
                      ),
                    ),
                    Text(
                      product.code,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.caption1Style.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                StatusBadgeWidget(status: product.status),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
