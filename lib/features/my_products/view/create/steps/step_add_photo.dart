import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/card/ui_custom_app_card.dart';
import '../widgets/header_text_card.dart';

class StepAddPhoto extends StatelessWidget {
  const StepAddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      child: Column(
        children: [
          const HeaderTextCard(
            header: "Foto detalhada",
            text:
                "Envie uma imagem do produto para facilitar a identificação e tornar seu registro mais completo.",
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async => {},
            child: DottedBorder(
              options: const RoundedRectDottedBorderOptions(
                dashPattern: [5, 5],
                strokeWidth: 2,
                radius: Radius.circular(15),
                color: AppColors.primaryColor,
                // padding: EdgeInsets.all(16),
              ),
              child: Container(
                color: Colors.white,
                width: context.percentWidth(0.9),
                height: context.percentWidth(0.4),
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
                          R.strings.addPhoto,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
