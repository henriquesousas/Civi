import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/list/components/item_menu_widget.dart';
import 'package:flutter/material.dart';

class ItemHeaderWidget extends StatelessWidget {
  final Item item;
  const ItemHeaderWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
            ),
            Text(item.code, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const ItemMenuWidget()
      ],
    );
  }
}
