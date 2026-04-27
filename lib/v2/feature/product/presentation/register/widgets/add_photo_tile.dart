import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPhotoTile extends StatelessWidget {
  final VoidCallback onTap;

  const AddPhotoTile({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeContainer.xxl.w,
        height: SizeContainer.xxl.h,
        decoration: BoxDecoration(
          color: context.themeColor.primaryBgColor,
          borderRadius: BorderRadius.circular(SizeRadius.s),
          border: Border.all(
            color: context.themeColor.outline,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_a_photo_outlined,
              color: Colors.white,
              size: SizeIcon.x,
            ),
            const SizedBox(height: SizeSpacing.s),
            Text(
              'Adicionar',
              style: context.appText.subtitle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
