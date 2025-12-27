import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:deehelp/features/products/domain/entities/product_type.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'header_text.dart';
import 'label_text.dart';

class ProductChooseItemCardWidget extends ConsumerWidget {
  final String title;
  final String subTitle;
  final List<ProductType> types;
  const ProductChooseItemCardWidget({
    super.key,
    required this.types,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          LabelText(
            textAlign: TextAlign.start,
            text: title,
            isRequired: true,
          ),
          SmallText(
            text: subTitle,
            textAlign: TextAlign.start,
            maxLine: 100,
            textStyle: context.appTextStyles.caption1Style.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 10),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                types.length,
                (index) {
                  final currentType = types[index];
                  return Expanded(
                    child: UICustomAppCard(
                      onPressed: () => ref
                          .watch(addProductViewModelProvider.notifier)
                          .selectProductType(currentType),
                      margin: index == 0
                          ? const EdgeInsetsDirectional.only(
                              end: 10,
                            )
                          : EdgeInsets.zero,
                      backgroundColor: currentType.isSelected
                          ? AppColors.primaryColor.withValues(alpha: 0.2)
                          : AppColors.whiteColor,
                      borderColor: currentType.isSelected
                          ? AppColors.primaryColor
                          : AppColors.lightGreyColor20,
                      padding: const EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 40,
                      ),
                      radius: Dimens.defaultRadius,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UIMyAssetsImageWidget(
                            isSvg: true,
                            assetPath: currentType.srcImage,
                            boxFit: BoxFit.contain,
                            width: double.infinity,
                            height: 25,
                            color: AppColors.blackColor.withValues(alpha: 1),
                          ),
                          HeaderText(
                            text: currentType.description,
                            textStyle:
                                context.appTextStyles.caption1Style.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
