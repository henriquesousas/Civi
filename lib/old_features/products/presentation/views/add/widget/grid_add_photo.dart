import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:deehelp/old_core/ui/widgets/image/ui_my_network_image_widget.dart';
import 'package:deehelp/old_features/products/domain/entities/image_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridAddPhoto extends StatelessWidget {
  final List<ImageMedia> photos;
  final VoidCallback? onAdd;
  final Function(int)? onRemove;
  final Function(int)? press;
  final double width;
  final double height;
  final int maxPhotos;
  final bool isLoading;

  const GridAddPhoto({
    Key? key,
    required this.photos,
    this.onAdd,
    this.onRemove,
    this.press,
    this.width = double.infinity,
    this.height = double.infinity,
    this.maxPhotos = 2,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: photos.length + (photos.length < maxPhotos ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < photos.length) {
              return _buildPhotoCard(photos[index], index, context);
            } else {
              return _buildAddButton(context);
            }
          },
        ),
      ],
    );
  }

  Widget _buildPhotoCard(ImageMedia image, int index, BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (press != null) {
              press!(index);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: image.source == MediaSource.api
                ? UIMyNetworkImageWidget(
                    radius: 8.0,
                    imageUrl: image.value,
                    width: width,
                    height: height,
                  )
                : UIMyAssetsImageWidget(
                    radius: 8.0,
                    isFile: true,
                    boxFit: BoxFit.cover,
                    assetPath: image.value,
                    width: width,
                    height: height,
                  ),
          ),
        ),
        if (onRemove != null)
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => onRemove!(index),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.darkGreyColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  size: Dimens.size16.w,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return GestureDetector(
      onTap: onAdd,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.5),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        ),
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Dimens.size16.w,
                    height: Dimens.size16.h,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor.withValues(alpha: 1),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).primaryColor,
                    size: Dimens.size22.w,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Adicionar',
                    style: context.appTextStyles.bodyTextStyle1.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    '${photos.length}/$maxPhotos',
                    style: context.appTextStyles.caption2Style.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
