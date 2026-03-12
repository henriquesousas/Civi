import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/feature/items/list/widgets/header_summary.dart';
import 'package:deehelp/feature/items/list/widgets/row_item_card.dart';
import 'package:deehelp/feature/items/list/widgets/verification_card.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemListView extends ConsumerWidget {
  final List<Product> items;
  final Function(Product) press;
  const ItemListView({
    super.key,
    required this.items,
    required this.press,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        if (items.isNotEmpty) ...[
          HeaderSummary(total: items.length),
          const SizedBox(height: SpacingSize.md),
          const VerificationInfoCard(),
          const SizedBox(height: SpacingSize.md),
        ],
        ...items.map(
          (it) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RowItemCard(
              item: it,
              onTap: () => press(it),
            ),
          ),
        ),
      ],
    );
  }
}
