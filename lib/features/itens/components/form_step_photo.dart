import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import 'header.dart';

class FormStepPhoto extends StatelessWidget {
  const FormStepPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          const Header(
            title: "Adicione uma foto",
            subtitle:
                "Envie uma imagem do produto para facilitar a identificação e tornar seu registro mais completo.",
          ),
          const SizedBox(height: 32),
          DottedBorder(
            options: const RoundedRectDottedBorderOptions(
              dashPattern: [5, 5],
              strokeWidth: 2,
              radius: Radius.circular(12),
              color: AppColors.primary,
              // padding: EdgeInsets.all(16),
            ),
            child: Container(
              color: Colors.white,
              width: context.screenWidth,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
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
          )
        ],
      ),
    );
  }
}
