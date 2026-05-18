import 'package:deehelp/old_core/ui/widgets/image/export_image.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/icon/ui_icon_card.dart';
import 'package:deehelp/v2/feature/product/product_status.dart';
import 'package:deehelp/v2/feature/product/product_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';

class ProductRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final ProductType type;
  final ProductStatus status;

  const ProductRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.status,
  });

  String get imageUrl {
    switch (type) {
      case ProductType.car:
        return 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=1200';

      case ProductType.motorcycle:
        return 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?q=80&w=1200';

      case ProductType.phone:
        return 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200';
    }
  }

  Color get statusColor {
    switch (status) {
      case ProductStatus.approved:
        return const Color(0xFF31D67B);

      case ProductStatus.pending:
        return const Color(0xFFFFB547);

      case ProductStatus.canceled:
        return const Color(0xFFFF6262);
    }
  }

  String get statusText {
    switch (status) {
      case ProductStatus.approved:
        return 'Aprovado';

      case ProductStatus.pending:
        return 'Pendente';

      case ProductStatus.canceled:
        return 'Cancelado';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(SizeRadius.xs),
      child: InkWell(
        borderRadius: BorderRadius.circular(SizeRadius.xs),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeLayoutSpacing.x,
            vertical: SizeLayoutSpacing.x,
          ),
          child: Row(
            children: [
              CustomNetworkImage(
                imageUrl: imageUrl,
                width: SizeImage.s.w,
                height: SizeImage.s.h,
                radius: SizeRadius.xxs,
              ),
              const SizedBox(width: SizeSpacing.m),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appText.subtitle.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: SizeSpacing.s),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appText.caption.copyWith(
                        color: context.themeColor.secundaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: SizeSpacing.s),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: .12),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        statusText,
                        style: context.appText.caption.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UIIconCard(
                bgColor: context.themeColor.secundaryBgColorLow,
                icon: Icon(
                  CupertinoIcons.delete,
                  color: Colors.white.withValues(alpha: .30),
                  size: SizeIcon.s,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
