import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/grid_add_photo.dart';
import 'package:deehelp/features/products/presentation/views/update/widgets/item_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoSection extends ConsumerWidget {
  const PhotoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(updateProductViewModelProvider);
    return UICustomAppCard(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          ItemDetailTile(
            title: "Fotos",
            subtitle: "${state.currentProduct!.images.length} Foto(s)",
            showDivider: false,
            showIconEdit: false,
            press: () async {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridAddPhoto(
              photos: state.currentProduct!.images,
              onRemove: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}
