import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/list/components/item_list_tile_modal_widget.dart';
import 'package:flutter/material.dart';

class ItemModalWidget extends StatelessWidget {
  final Item item;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ItemModalWidget(
      {super.key,
      required this.item,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: AppColors.lightGreyColor),
          ItemListTileModalWidget(
            icon: Icons.edit_outlined,
            title: 'Editar',
            color: AppColors.darkGreyColor10,
            onTap: onEdit,
          ),
          ItemListTileModalWidget(
            icon: Icons.delete_outline,
            title: 'Excluir',
            color: AppColors.errorColor,
            onTap: onDelete,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
