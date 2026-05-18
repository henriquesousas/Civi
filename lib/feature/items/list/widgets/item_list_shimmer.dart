import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/feature/items/list/row_item_card_skeleton.dart';
import 'package:deehelp/old_core/shimmer_animation.dart';
import 'package:flutter/material.dart';

//Ta sendo usado por ItemListPage e IncideListPage

class ItemListShimmer extends StatelessWidget {
  const ItemListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerAnimation(
      enabled: true,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(height: SpacingSize.sm),
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const RowItemCardSkeleton();
        },
      ),
    );
  }
}
