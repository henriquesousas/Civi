import 'package:deehelp/core/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/my_products/domain/entities/product.dart';
import 'package:deehelp/features/my_products/presentation/listing/components/my_products_list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../domain/entities/product_id.dart';
import '../../../domain/product_status.dart';

class ListingMyProductsShimmer extends StatelessWidget {
  final bool isGrid;

  const ListingMyProductsShimmer({super.key, this.isGrid = false});

  @override
  Widget build(BuildContext context) {
    final productShimmer = Product(
      id: ProductId.unique(),
      name: "a" * 10,
      code: "a" * 5,
      type: "a" * 5,
      color: "a" * 5,
      brand: "a" * 5,
      obs: "a" * 5,
      year: 0000,
      image: null,
      userId: "a",
      status: ProductSatus.active,
    );

    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      child: isGrid
          ? GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const UICustomAppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Bone.square(size: 60),
                      ),
                      // spaceDown(Dimensions.space10),
                      SizedBox(height: 10), Bone.text(width: 100),
                    ],
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return MyProductsListTileCard(product: productShimmer);
              },
            ),
    );
  }
}
