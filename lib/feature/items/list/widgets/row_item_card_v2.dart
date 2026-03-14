import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/core/theme/size/icon_size.dart';
import 'package:deehelp/core/ui/widgets/badge/status_badge.dart';
import 'package:deehelp/core/ui/widgets/badge/status_style.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
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

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 20, 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Cadastrado ${item.createdAt?.timeAgo()}',
                            style: TextStyle(
                              color: const Color(0xFF8D8D93),
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
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
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
                        color: const Color(0xFFE7E7EA),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    StatusBadgeV2(
                        status: EnumUtils.fromString(
                            ItemStatus.values, item.status.name))
                  ],
                ),
              ),
            ),
            Column(
              children: [
                if (item.type == ItemType.phone.name) ...[
                  const BlurredLockedImage(),
                ] else ...[
                  // FutureBuilder(
                  //   future: Future.delayed(const Duration(seconds: 5)),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState != ConnectionState.done) {
                  //       return ImageShimmer(
                  //         width: 120.w,
                  //         height: 138.h,
                  //         radius: 28,
                  //       );
                  //     }

                  //     return CustomNetworkImage(
                  //       imageUrl:
                  //           item.images.isNotEmpty ? item.images[0].value : '',
                  //       height: 140,
                  //       width: 120,
                  //       radius: 24,
                  //     );
                  //   },
                  // ),
                  CustomNetworkImage(
                    width: 105.w,
                    height: 120.h,
                    radius: 28,
                    imageUrl:
                        item.images.isNotEmpty ? item.images[0].value : null,
                    // imageUrl: item.images[0].value,

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
    );
  }
}

class BlurredLockedImage extends StatelessWidget {
  const BlurredLockedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
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
              borderRadius: BorderRadius.circular(28),
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
