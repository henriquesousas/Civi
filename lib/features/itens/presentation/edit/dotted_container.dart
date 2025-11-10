import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../app/localization/image_config.dart';
import '../../../../app/theme/app_colors_v2.dart';

class DottedContainer extends StatelessWidget {
  final double height;
  final double width;
  final String? image;
  const DottedContainer(
      {super.key, required this.height, required this.width, this.image});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: const RoundedRectDottedBorderOptions(
        dashPattern: [5, 5],
        strokeWidth: 2,
        radius: Radius.circular(12),
        color: AppColorsV2.primary,
        // padding: EdgeInsets.all(16),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      ImageConfig.fakeCarro3,
                      // width: 300,
                      height: height,
                      fit: BoxFit.cover,
                    ),
                  )
                : Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.black.withValues(alpha: 0.2),
                      ),
                      Text(
                        'Adicionar foto',
                        style: context.getTextStyle.small,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
