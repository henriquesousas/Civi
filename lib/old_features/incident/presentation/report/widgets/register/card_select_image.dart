import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/image/ui_my_network_image_widget.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../old_core/ui/widgets/card/ui_custom_app_card.dart';

class CardSelectImage extends StatelessWidget {
  final VoidCallback press;
  final Product? product;
  const CardSelectImage({
    super.key,
    required this.press,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          if (product == null) ...[
            Container(
              width: Dimens.size64.w,
              height: Dimens.size64.h,
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor20,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: const Icon(
                Icons.image,
                color: AppColors.greyColor,
              ),
            ),
          ],
          if (product != null) ...[
            UIMyNetworkImageWidget(
              imageUrl: product!.images.first.path,
            )
          ],
          Expanded(
            child: Text(
              product == null ? "Selecionar veículo" : product!.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.appTextStyles.bodyTextStyle1,
            ),
          ),
          IconButton(
            onPressed: press,
            icon: const Icon(
              Icons.arrow_circle_right,
              color: AppColors.darkGreyColor10,
              // size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
