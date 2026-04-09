import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/feature/incidents/list/widgets/fake_incident_list_model.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_how_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class IncidentListItem extends StatelessWidget {
//   final IncidentOutput incident;
//   final EdgeInsets? padding;
//   final EdgeInsets? margin;
//   final double width;
//   final VoidCallback? onPressed;
//   final bool isPress;
//   final bool isLoading;

//   const IncidentListItem({
//     super.key,
//     required this.incident,
//     this.width = double.infinity,
//     this.onPressed,
//     this.isPress = false,
//     this.padding,
//     this.margin,
//     this.isLoading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onPressed != null
//             ? () {
//                 HapticFeedback.lightImpact();
//                 onPressed!();
//               }
//             : null,
//         borderRadius: BorderRadius.circular(24),
//         splashColor: context.primaryColor.withValues(alpha: 0.06),
//         highlightColor: context.primaryColor.withValues(alpha: 0.05),
//         child: Container(
//           decoration: BoxDecoration(
//             color: context.surfaceColor,
//             borderRadius:
//                 const BorderRadius.all(Radius.circular(RadiusSize.lg)),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0x142B5BEE),
//                 blurRadius: 16,
//                 offset: Offset(0, 8),
//               ),
//             ],
//             // ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   spacing: 12,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     IncidentImage(
//                         images: incident.product == null
//                             ? []
//                             : incident.product!.images),
//                     Expanded(
//                       child: Column(
//                         spacing: 7,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           IncidentTitle(title: incident.product?.name ?? ''),
//                           IncidentLocation(local: incident.local),
//                           IncidentDate(occurreAt: incident.occurredAt),
//                           IncidentCode(code: incident.product?.code ?? ''),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 if (!isLoading) ...[
//                   const SizedBox(height: SpacingSize.lg),
//                   IncidentHowTo(howTo: incident.howTo),
//                   const SizedBox(height: SpacingSize.md),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     spacing: 5,
//                     children: [
//                       IncidentProtocol(
//                         protocolNumber: incident.alertId,
//                       ),
//                       // IncidentCode(code: incident.product.code),
//                       StatusBadge(style: StatusStyle.from(incident.status))
//                     ],
//                   ),
//                 ]
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class IncidentListItemV2 extends StatelessWidget {
  final IncidentOutput incident;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double width;
  final VoidCallback? onPressed;
  final bool isPress;
  final bool isLoading;

  const IncidentListItemV2({
    super.key,
    required this.incident,
    this.width = double.infinity,
    this.onPressed,
    this.isPress = false,
    this.padding,
    this.margin,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    // const accent = Color(0xFF8F98FF);

    return Container(
      color: context.primaryBgCard,
      child: InkWell(
        onTap: onPressed != null
            ? () {
                HapticFeedback.lightImpact();
                onPressed!();
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      incident.product?.name ?? '',
                      style: TextStyle(
                        color: context.primaryTextColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.8,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Roubado ${incident.createdAt.timeAgo()}',
                            maxLines: 2,
                            style: TextStyle(
                              color: context.secondaryTextColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${incident.local?.city} · ${incident.local?.state}  ${incident.local?.address ?? ''}',
                      maxLines: 2,
                      style: TextStyle(
                        color: context.secondaryTextColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 14),
                    // Text(
                    //   incident.product?.name ?? '',
                    //   style: TextStyle(
                    //     color: context.primaryTextColor,
                    //     fontSize: 18.sp,
                    //     fontWeight: FontWeight.w800,
                    //     letterSpacing: -0.8,
                    //     height: 1.0,
                    //   ),
                    // ),
                    // const SizedBox(height: 10),
                    Text(
                      incident.product?.type != ItemTypeOld.phone.name
                          ? 'Placa: ${incident.product?.code} · ${incident.product?.color}'
                          : 'IMEI: ${incident.product?.code} · ${incident.product?.color}',
                      style: TextStyle(
                        // color: const Color(0xFFE7E7EA),
                        color: context.primaryTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    IncidentHowTo(howTo: incident.howTo),
                    // const SizedBox(height: 20),
                    // StatusBadgeV2(
                    //     status: EnumUtils.fromString(
                    //         ItemStatus.values, incident.status.name)),
                  ],
                ),
              ),
              Column(
                children: [
                  if (incident.product?.type == ItemTypeOld.phone.name) ...[
                    // const BlurredLockedImage(),
                    CiviImageCard(
                      assetPath: 'assets/images/phone_pin_v2.png',
                      width: 70.w,
                      height: 70.h,
                    ),
                    const SizedBox(height: 10),
                    StatusBadgeV2(
                      status: EnumUtils.fromString(
                          ItemStatus.values, incident.status.name),
                    ),
                  ] else ...[
                    CustomNetworkImage(
                      width: 70.w,
                      height: 70.w,
                      radius: 22,
                      imageUrl: incident.product!.images.isNotEmpty
                          ? incident.product?.images[0].value
                          : null,
                      customErrorWidget: Icon(
                        Icons.phone_android,
                        size: IconSizes.xl,
                        color: context.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                    const SizedBox(height: 10),
                    StatusBadgeV2(
                      status: EnumUtils.fromString(
                          ItemStatus.values, incident.status.name),
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   borderRadius: BorderRadius.circular(12),
                    //   child: const Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    //     child: Row(
                    //       children: [
                    //         Icon(
                    //           Icons.reply_rounded,
                    //           color: Colors.white,
                    //           size: 21,
                    //         ),
                    //         SizedBox(width: 8),
                    //         Text(
                    //           'Share',
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w600,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
