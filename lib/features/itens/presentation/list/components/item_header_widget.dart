import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:flutter/material.dart';

class ItemHeaderWidget extends StatelessWidget {
  final Item item;
  const ItemHeaderWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                // fontSize: 18,
              ),
        ),
        Text(item.code, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
