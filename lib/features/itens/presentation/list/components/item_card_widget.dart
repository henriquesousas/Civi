import 'package:deehelp/core/components/images/ui_network_image_with_loader.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/list/components/status_badge_widget.dart';
import 'package:flutter/material.dart';

import 'item_header_widget.dart';

class ItemCardWidget extends StatelessWidget {
  final Item item;
  final int index;

  const ItemCardWidget({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: switch (index) {
          0 => const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          -1 => const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          _ => BorderRadius.circular(1),
        },
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {},
          splashColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                UINetworkImageWithLoader(
                  src: item.imageUrl ?? "",
                  width: 90,
                  height: 90,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemHeaderWidget(item: item),
                      StatusBadgeWidget(status: item.status),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
