import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/list/components/item_list_tile_modal_widget.dart';
import 'package:flutter/material.dart';

class ItemModalWidget extends StatelessWidget {
  final Item item;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onClose;

  const ItemModalWidget(
      {super.key,
      required this.item,
      required this.onDelete,
      required this.onEdit,
      required this.onClose});

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
          ItemListTileModalWidget(
            icon: Icons.close,
            title: 'Fechar',
            color: AppColors.greyColor,
            onTap: onClose,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
