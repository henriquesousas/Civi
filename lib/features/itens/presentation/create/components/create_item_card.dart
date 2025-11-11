import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/itens/presentation/create/utils/type_item_select.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors_v2.dart';

class CreateItemCard extends StatelessWidget {
  final TypeItemSelect item;
  final VoidCallback onTap;
  const CreateItemCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: item.isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 10,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: item.isSelected
                        ? AppColors.primaryColorDark
                        : AppColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item.icon,
                    color:
                        item.isSelected ? Colors.white : AppColors.primaryColor,
                    size: 20,
                  ),
                ),
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: item.isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: item.isSelected
                            ? Colors.white
                            : AppColorsV2.blackColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: item.isSelected
                    ? const Icon(
                        Icons.check,
                        size: 10,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
