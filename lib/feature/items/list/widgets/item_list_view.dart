import 'package:deehelp/feature/items/list/widgets/header_summary.dart';
import 'package:deehelp/feature/items/list/widgets/row_item_card_v2.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemListView extends ConsumerWidget {
  final List<Product> items;
  final Function(Product) press;
  final Future<void> Function() onRefresh;
  const ItemListView({
    super.key,
    required this.items,
    required this.press,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        if (items.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: HeaderSummary(total: items.length),
          ),
          const SizedBox(height: 5),
          // const VerificationInfoCard(),
          //   const SizedBox(height: SpacingSize.md),
          const Divider(
            color: Color(0xFF1C1C1E),
            height: 1,
          ),
        ],
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.separated(
              // physics: const BouncingScrollPhysics(),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final it = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: RowItemCardV2(
                    item: it,
                    onTap: () => press(it),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Color(0xFF1C1C1E),
                  // color: Colors.grey,
                  height: 1,
                );
              },
            ),
          ),
        )
      ],
    );
    // return ListView(
    //   physics: const BouncingScrollPhysics(),
    //   // padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
    //   children: [
    //     if (items.isNotEmpty) ...[
    //       HeaderSummary(total: items.length),
    //       const SizedBox(height: SpacingSize.lg),
    //       // const VerificationInfoCard(),
    //       //   const SizedBox(height: SpacingSize.md),
    //     ],
    //     ...items.map(
    //       (it) => Padding(
    //         padding: const EdgeInsets.only(bottom: 12),
    //         child: RowItemCardV2(
    //           item: it,
    //           onTap: () => press(it),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
