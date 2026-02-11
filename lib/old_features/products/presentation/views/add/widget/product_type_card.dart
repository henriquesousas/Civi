import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTypeCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageSrc;
  final bool isSelected;
  final VoidCallback? press;
  const ProductTypeCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.isSelected,
    this.press,
  });

  @override
  State<ProductTypeCard> createState() => _ProductTypeCardState();
}

class _ProductTypeCardState extends State<ProductTypeCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.defaultRadius.r),
        color: widget.isSelected
            ? AppColors.primaryColor.withValues(alpha: 0.08)
            : Theme.of(context).colorScheme.surfaceContainer,
        border: Border.all(
          color: widget.isSelected
              ? AppColors.primaryColor
              : Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          width: widget.isSelected ? 2 : 1,
        ),
        boxShadow: widget.isSelected
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Dimens.defaultRadius.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(Dimens.defaultRadius.r),
          onTap: widget.press,
          splashColor: AppColors.primaryColor.withValues(alpha: 0.1),
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(Dimens.size16.r),
            child: Row(
              children: [
                Container(
                  width: Dimens.size50.r,
                  height: Dimens.size50.r,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? AppColors.primaryColor.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(Dimens.size10.r),
                  ),
                  child: Center(
                    child: UIMyAssetsImageWidget(
                      isSvg: true,
                      assetPath: widget.imageSrc,
                      width: Dimens.size26.r,
                      height: Dimens.size26.r,
                      color: widget.isSelected
                          ? AppColors.primaryColor
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                SizedBox(width: Dimens.size16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.appTextStyles.sectionTitle.copyWith(
                          fontWeight: FontWeight.normal,
                          // color: AppColors.textColorBody,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      // Text(
                      //   widget.description,
                      //   maxLines: 2,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: context.appTextStyles.caption1Style.copyWith(
                      //     color: AppColors.textSecondary,
                      //   ),
                      // )
                    ],
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: widget.isSelected
                      ? Container(
                          width: Dimens.size22.r,
                          height: Dimens.size22.r,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            size: Dimens.size16.r,
                            color: Colors.white,
                            // color: Theme.of(context)
                            //     .colorScheme
                            //     .secondaryContainer,
                          ),
                        )
                      : Container(
                          width: Dimens.size22.r,
                          height: Dimens.size22.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                              width: 1.5,
                            ),
                          ),
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
