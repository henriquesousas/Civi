import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Product item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final imageUrl = item.images.isNotEmpty ? item.images.first.value : '';
    final isPhone = item.type == ItemType.phone.name;

    if (!isPhone) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          width: ImageSize.xs,
          height: ImageSize.xs,
          // color: const Color(0xFFF5F7FD),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _fallbackIcon(context, isPhone),
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Center(
                child: SizedBox(
                  width: ProgressIndicatorSizes.md,
                  height: ProgressIndicatorSizes.md,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
          ),
        ),
      );
    }

    // Celular (ou veículo sem foto): mantém como estava
    return _fallbackIcon(context, isPhone);
  }

  Widget _fallbackIcon(BuildContext context, bool isPhone) {
    return Container(
      width: IconSizes.xxl,
      height: IconSizes.xxl,
      decoration: BoxDecoration(
        color: context.primaryColor.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.primaryColor.withValues(alpha: 0.12)),
      ),
      child: Icon(
        isPhone ? Icons.phone_iphone_outlined : Icons.directions_car_outlined,
        color: isPhone ? context.onSurface : context.primaryColor,
        size: IconSizes.md,
      ),
    );
  }
}
