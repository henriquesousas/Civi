import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/product/presentation/listing/components/product_modal_action_tile.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/buttons/ui_outline_button.dart';
import '../../../domain/entities/product.dart';

class ProductModalWidget extends StatelessWidget {
  final Product item;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onClose;

  const ProductModalWidget({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onEdit,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.directions_car,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.lightGreyColor30),
            ),
            child: Column(
              children: [
                ProductModalActionTile(
                  icon: Icons.edit_outlined,
                  title: 'Editar Veículo',
                  subtitle: 'Modificar informações',
                  color: AppColors.primaryColor,
                  onTap: onEdit,
                  showDivider: true,
                ),
                ProductModalActionTile(
                  icon: Icons.delete_outline,
                  title: 'Excluir Veículo',
                  subtitle: 'Remover permanentemente',
                  color: AppColors.errorColor,
                  onTap: onDelete,
                  showDivider: false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          UIOutlineButton(
            text: 'Fechar',
            press: onClose,
            textColor: AppColors.primaryColorDark,
            borderColor: AppColors.primaryColorDark,
          )
        ],
      ),
    );
  }
}
