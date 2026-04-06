import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/core/theme/size/icon_size.dart';
import 'package:deehelp/core/ui/widgets/badge/status_badge.dart';
import 'package:deehelp/core/ui/widgets/badge/status_style.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/feature/incidents/list/widgets/fake_incident_list_model.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowItemCardV2 extends StatelessWidget {
  final Product item;
  final VoidCallback? onTap;
  final VoidCallback? onShare;

  const RowItemCardV2({
    super.key,
    required this.item,
    this.onTap,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    // const accent = Color(0xFF8F98FF);

    return Container(
      color: context.primaryBgCard,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Cadastrado ${item.createdAt?.timeAgo()}',
                            style: TextStyle(
                              // color: const Color(0xFF8D8D93),
                              color: context.secondaryTextColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      item.name,
                      style: TextStyle(
                        color: context.primaryTextColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.8,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.type != ItemType.phone.name
                          ? 'Placa: ${item.code} · ${item.color} · ${item.year}'
                          : 'IMEI: ${item.code} · ${item.color}',
                      style: TextStyle(
                        color: context.secondaryTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    StatusBadgeV2(
                      status: EnumUtils.fromString(
                          ItemStatus.values, item.status.name),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  if (item.type == ItemType.phone.name) ...[
                    // const BlurredLockedImageV2(),
                    CiviImageCard(
                      assetPath: 'assets/images/phone_pin_v2.png',
                      width: 70.w,
                      height: 70.h,
                    ),
                  ] else ...[
                    CustomNetworkImage(
                      width: 70.w,
                      height: 70.w,
                      radius: 22,
                      imageUrl:
                          item.images.isNotEmpty ? item.images[0].value : null,
                      customErrorWidget: Icon(
                        Icons.phone_android,
                        size: IconSizes.xl,
                        color: context.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlurredLockedImage extends StatelessWidget {
  const BlurredLockedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8D7C2),
            Color(0xFFB59E8D),
            Color(0xFF4C5672),
            Color(0xFF1B2338),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.black.withValues(alpha: 0.18),
            ),
          ),
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: const Color(0xFF8EA2FF).withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.phone_android,
              color: const Color(0xFF9FB1FF),
              size: 22.w,
            ),
          ),
        ],
      ),
    );
  }
}

class BlurredLockedImageV2 extends StatelessWidget {
  final double size;
  final double borderRadius;
  final IconData icon;

  const BlurredLockedImageV2({
    super.key,
    this.size = 90,
    this.borderRadius = 22,
    this.icon = Icons.phone_android,
  });

  @override
  Widget build(BuildContext context) {
    final iconContainerSize = size * 0.62;
    final iconSize = size * 0.24;

    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF6F8FC),
            Color(0xFFE9EEF8),
            Color(0xFFDCE5F7),
          ],
        ),
        border: Border.all(
          color: context.outlineVariantColor.withValues(alpha: 0.7),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.white.withValues(alpha: 0.18),
            ),
          ),
          Container(
            width: iconContainerSize.w,
            height: iconContainerSize.h,
            decoration: BoxDecoration(
              color: context.primaryColor.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: context.primaryColor,
              size: iconSize.w,
            ),
          ),
        ],
      ),
    );
  }
}
