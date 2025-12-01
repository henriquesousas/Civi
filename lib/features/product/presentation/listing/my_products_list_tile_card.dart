import 'package:deehelp/core/components/dimens_test.dart';
import 'package:deehelp/core/components/ui_my_network_image_widget.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/utils/date_utils.dart';
import 'package:deehelp/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/my_text_style.dart';
import '../../../../core/theme/app_colors.dart';
import 'components/status_badge_widget.dart';

class MyProductsListTileCard extends StatelessWidget {
  final Product product;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double width;
  final Color backgroundColor;
  final double radius;
  final VoidCallback? onPressed;
  final bool? showBorder;
  final bool isPress;

  const MyProductsListTileCard({
    super.key,
    required this.product,
    this.width = double.infinity,
    this.backgroundColor = Colors.transparent,
    this.radius = 0,
    this.onPressed,
    this.isPress = false,
    this.padding,
    this.margin,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: width,
          padding: (padding ??
              const EdgeInsetsDirectional.symmetric(
                vertical: DimensTest.space10,
              )),
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: showBorder == true
                ? const Border(
                    bottom: BorderSide(
                      color: Color(0xFFE2E8F0),
                      width: 1,
                    ),
                  )
                : null,
          ),
          child: ListTile(
            minTileHeight: 0,
            minVerticalPadding: DimensTest.space8,
            horizontalTitleGap: DimensTest.space8,
            leading: UIMyNetworkImageWidget(
              imageUrl: product.image?.value ?? '',
              width: 50,
              height: 50,
            ),
            title: Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      product.name,
                      style: MyTextStyle.sectionTitle3,
                    ),
                  ),
                  StatusBadgeWidget(
                    status: product.status,
                  )
                ],
              ),
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.code,
                      style: context.appTextStyles.sectionSubTitle1.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.bodyText,
                      ),
                    ),
                    Text(
                      "Data da criação: ${product.createdAt?.formatPtBr()}",
                      style: context.appTextStyles.caption2Style.copyWith(
                          fontSize: DimensTest.fontExtraSmall,
                          color: AppColors.textColorBody),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.textColorBody,
                  size: DimensTest.space10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
