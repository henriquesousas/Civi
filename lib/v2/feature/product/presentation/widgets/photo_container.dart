import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/feature/product/presentation/widgets/add_photo_tile.dart';
import 'package:deehelp/v2/feature/product/presentation/widgets/photo_view_tile.dart';
import 'package:flutter/material.dart';

class PhotoContainer extends StatelessWidget {
  final List<String> photos;
  final VoidCallback onAdd;
  const PhotoContainer({super.key, required this.photos, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: SizeLayoutSpacing.m,
        vertical: SizeLayoutSpacing.m,
      ),
      decoration: BoxDecoration(
        color: context.themeColor.secundaryBgColorLow,
        borderRadius: BorderRadius.circular(SizeRadius.s),
        border: Border.all(
          color: const Color(0xFF1C1C1C),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AddPhotoTile(
                onTap: onAdd,
              ),
              ...List.generate(
                photos.length,
                (index) => PhotoPreviewTile(
                  label: 'Foto ${index + 1}',
                  onRemove: () => {},
                ),
              ),
            ],
          ),
          if (photos.isEmpty) ...[
            const SizedBox(height: SizeSpacing.m),
            Text(
              'Nenhuma foto adicionada ainda.',
              style: context.appText.caption.copyWith(
                color: context.themeColor.secundaryTextColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
