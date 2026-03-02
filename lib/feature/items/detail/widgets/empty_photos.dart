import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class EmptyPhotos extends StatelessWidget {
  const EmptyPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyLight,
      child: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: LayoutSpacingSize.card),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.photo_library_outlined,
                size: IconSizes.xl,
                color: context.secondaryColor,
              ),
              const SizedBox(height: SpacingSize.md),
              Text(
                'Nenhuma foto adicionada',
                style: context.appText.bodySmall.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.onSurface,
                ),
              ),
              const SizedBox(height: SpacingSize.xs),
              Text(
                'Adicione fotos para facilitar a identificação.',
                textAlign: TextAlign.center,
                style: context.appText.caption.copyWith(
                  color: context.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
