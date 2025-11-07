import 'package:deehelp/features/itens/my_item.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors_v2.dart';

class CreateItemCard extends StatelessWidget {
  final MyItem item;
  final VoidCallback onTap;
  const CreateItemCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: item.isSelected ? AppColorsV2.primaryDark : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: item.isSelected
                    ? AppColorsV2.primary
                    : AppColorsV2.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item.icon,
                color: item.isSelected ? Colors.white : AppColorsV2.primary,
                size: 20,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item.name,
              style: context.getTextStyle.regular.copyWith(
                color: item.isSelected ? Colors.white : AppColorsV2.blackColor,
                fontWeight: item.isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: context.responsiveText(0.033),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
