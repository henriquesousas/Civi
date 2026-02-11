import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/image/ui_my_network_image_widget.dart';
import 'package:deehelp/old_features/products/domain/entities/image_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentImage extends StatelessWidget {
  final List<ImageMedia> images;
  const IncidentImage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.lightGreyColor,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.r),
        child: UIMyNetworkImageWidget(
          imageUrl: images.isNotEmpty ? images.first.value : '',
          width: Dimens.size70.w,
          height: Dimens.size70.w,
        ),
      ),
    );
  }
}
