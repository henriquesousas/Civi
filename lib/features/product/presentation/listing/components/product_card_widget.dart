import 'package:deehelp/core/components/images/ui_network_image_with_loader.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/product/presentation/listing/components/status_badge_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
import 'product_header_widget.dart';
import 'product_menu_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final Product item;
  final int index;
  final VoidCallback? onMenuPress;
  final VoidCallback press;

  const ProductCardWidget({
    super.key,
    required this.item,
    required this.index,
    this.onMenuPress,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 3),
          ),
        ],
        // border: Border.all(color: AppColors.lightGreyColor),
        border: BoxBorder.all(
          color: AppColors.primaryColor.withValues(alpha: 0.1),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: press,
          splashColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                UINetworkImageWithLoader(
                  src: item.image?.file.path ?? "",
                  radius: 12,
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductHeaderWidget(item: item),
                          ProductMenuWidget(press: onMenuPress ?? () {})
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: AppColors.greyColor
                                      .withValues(alpha: 0.3),
                                  width: 1),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.brand,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: AppColors.greyColor
                                      .withValues(alpha: 0.3),
                                  width: 1),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.color,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      StatusBadgeWidget(status: item.status),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
