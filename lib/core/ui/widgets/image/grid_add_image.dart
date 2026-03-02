import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:flutter/material.dart';

class GridAddImage extends StatelessWidget {
  final List<ImageMedia> photos;
  final VoidCallback? onAdd;
  final Function(int)? onRemove;
  final Function(int)? press;
  final double width;
  final double height;
  final int maxPhotos;

  /// ✅ loading do botão "Adicionar" (antes era isLoading)
  final bool isAddLoading;

  /// ✅ índice da foto que está carregando (ex.: deletando/upload)
  /// - null = nenhuma
  /// - 0..N-1 = mostra spinner em cima daquela foto
  final int? loadingIndex;

  /// ✅ opcional: bloqueia todas as interações enquanto carrega
  final bool blockWhileLoading;

  const GridAddImage({
    Key? key,
    required this.photos,
    this.onAdd,
    this.onRemove,
    this.press,
    this.width = double.infinity,
    this.height = double.infinity,
    this.maxPhotos = 2,
    this.isAddLoading = false,
    this.loadingIndex,
    this.blockWhileLoading = false,
  }) : super(key: key);

  bool _isPhotoLoading(int index) =>
      loadingIndex != null && loadingIndex == index;

  bool get _hasAnyLoading => isAddLoading || loadingIndex != null;

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
    final isLoadingThis = _isPhotoLoading(index);
    final shouldBlock = blockWhileLoading && _hasAnyLoading;

    return Stack(
      children: [
        AbsorbPointer(
          absorbing: shouldBlock || isLoadingThis,
          child: GestureDetector(
            onTap: () {
              if (press != null) press!(index);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: image.source == MediaSource.api
                  ? CustomNetworkImage(
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
        ),

        // ✅ botão remover (some enquanto aquela imagem está carregando)
        if (onRemove != null && !isLoadingThis)
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => onRemove!(index),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: context.onSurface.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  size: IconSizes.sm,
                  color: Colors.white,
                ),
              ),
            ),
          ),

        // ✅ overlay de loading por imagem
        if (isLoadingThis)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: SizedBox(
                  width: IconSizes.sm,
                  height: IconSizes.sm,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.6,
                    color: context.primaryColor.withValues(alpha: 1),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    final shouldBlock = blockWhileLoading && _hasAnyLoading;

    return AbsorbPointer(
      absorbing: shouldBlock || isAddLoading,
      child: GestureDetector(
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
          child: isAddLoading
              ? Center(
                  child: SizedBox(
                    width: IconSizes.sm,
                    height: IconSizes.sm,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.6,
                      color: context.primaryColor.withValues(alpha: 1),
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Theme.of(context).primaryColor,
                      size: IconSizes.sm,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Adicionar',
                      style: context.appText.headersm.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      '${photos.length}/$maxPhotos',
                      style: context.appText.caption.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
