import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/list/widgets/header_summary.dart';
import 'package:deehelp/feature/items/list/widgets/row_item_card.dart';
import 'package:deehelp/feature/items/list/widgets/verification_card.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemListView extends StatelessWidget {
  final List<Product> items;
  const ItemListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
              onTap: () => context.push(ItemsRouter.detail),
            ),
          ),
        ),
      ],
    );
  }
}
