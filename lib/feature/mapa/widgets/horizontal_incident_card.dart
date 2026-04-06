import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/size/icon_container_size.dart';
import 'package:deehelp/core/theme/size/icon_size.dart';
import 'package:deehelp/core/theme/size/image_size.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_assets_image_widget.dart';
import 'package:deehelp/feature/mapa/widgets/type_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalIncidentCard extends StatelessWidget {
  final String incidentType;
  final String title;
  final String locationLabel;
  final String timeLabel;
  final String distanceLabel;
  final bool isPlatformGenerated;
  final String? coverImageUrl;
  final bool isAssetImage;
  final String? howTo;
  final VoidCallback? onTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onBookmarkTap;
  // final int confirmations;
  // final List<String> participantAvatarUrls;

  const HorizontalIncidentCard({
    super.key,
    required this.incidentType,
    required this.title,
    required this.locationLabel,
    required this.timeLabel,
    required this.distanceLabel,
    required this.coverImageUrl,
    required this.isAssetImage,
    // required this.confirmations,
    // required this.participantAvatarUrls,
    this.isPlatformGenerated = false,
    this.onTap,
    this.onShareTap,
    this.onBookmarkTap,
    this.howTo,
  });

  Color get _badgeColor {
    return AppColors.danger;
    // switch (incidentType.toLowerCase()) {
    //   case 'roubo':
    //     return AppColors.danger;
    //   case 'furto':
    //     return const Color(0xFFF59E0B);
    //   case 'suspeito':
    //     return const Color(0xFF8B5CF6);
    //   case 'recuperado':
    //     return AppColors.success;
    //   default:
    //     return AppColors.primaryColor;
    // }
  }

  // IconData get _incidentIcon {
  //   switch (incidentType.toLowerCase()) {
  //     case 'roubo':
  //       return Icons.local_police_outlined;
  //     case 'furto':
  //       return Icons.warning_amber_rounded;
  //     case 'suspeito':
  //       return Icons.visibility_outlined;
  //     case 'recuperado':
  //       return Icons.verified_rounded;
  //     default:
  //       return Icons.report_gmailerrorred_rounded;
  //   }
  // }

  //

  @override
  Widget build(BuildContext context) {
    final subtitle = '$locationLabel • $timeLabel • $distanceLabel';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 1),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF111318),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.05),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.6),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
            BoxShadow(
              color: _badgeColor.withValues(alpha: 0.08),
              blurRadius: 20,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TOPO
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isAssetImage) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: CustomNetworkImage(
                      width: ImageSize.sm,
                      height: ImageSize.sm,
                      imageUrl: coverImageUrl,
                    ),
                  ),
                ] else ...[
                  CiviImageCard(
                    assetPath: coverImageUrl!,
                    width: ImageSize.sm,
                    height: ImageSize.sm,
                  ),
                ],
                const SizedBox(width: 10),

                /// TEXTO
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Wrap(
                      //   crossAxisAlignment: WrapCrossAlignment.center,
                      //   spacing: 6,
                      //   runSpacing: 6,
                      //   children: [
                      //     TypeBadge(
                      //       label: incidentType,
                      //       textColor: Colors.white,
                      //       bgColor: _badgeColor.withValues(alpha: 0.9),
                      //     ),

                      //     /// status pill
                      //     Container(
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: 10,
                      //         vertical: 5,
                      //       ),
                      //       decoration: BoxDecoration(
                      //         color: _badgeColor.withValues(alpha: 0.12),
                      //         borderRadius: BorderRadius.circular(999),
                      //       ),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           Icon(
                      //             _incidentIcon,
                      //             size: IconSizes.xs,
                      //             color: _badgeColor,
                      //           ),
                      //           const SizedBox(width: 4),
                      //           Text(
                      //             'Ativo',
                      //             style: context.appText.caption.copyWith(
                      //               color: _badgeColor,
                      //               fontWeight: FontWeight.w700,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     // Spacer(),
                      //     HighlightIcon(
                      //       radius: 10,
                      //       containerSize: IconContainerSizes.xs,
                      //       icon: Icon(
                      //         Icons.share_outlined,
                      //         size: IconSizes.xxs,
                      //         color: Colors.white.withValues(alpha: 0.7),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// ESQUERDA (badges)
                          Expanded(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                TypeBadge(
                                  label: incidentType,
                                  textColor: Colors.white,
                                  bgColor: _badgeColor.withValues(alpha: 0.9),
                                ),
                                // Container(
                                //   padding: const EdgeInsets.symmetric(
                                //     horizontal: 10,
                                //     vertical: 5,
                                //   ),
                                //   decoration: BoxDecoration(
                                //     color: _badgeColor.withValues(alpha: 0.12),
                                //     borderRadius: BorderRadius.circular(999),
                                //   ),
                                //   child: Row(
                                //     mainAxisSize: MainAxisSize.min,
                                //     children: [
                                //       Icon(
                                //         _incidentIcon,
                                //         size: IconSizes.xs,
                                //         color: _badgeColor,
                                //       ),
                                //       const SizedBox(width: 4),
                                //       Text(
                                //         'Ativo',
                                //         style: context.appText.caption.copyWith(
                                //           color: _badgeColor,
                                //           fontWeight: FontWeight.w700,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),

                          /// DIREITA (ação)
                          GestureDetector(
                            onTap: onShareTap,
                            child: HighlightIcon(
                              radius: 10,
                              containerSize: IconContainerSizes.sm,
                              icon: Icon(
                                Icons.share_outlined,
                                size: IconSizes.md,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.appText.body.copyWith(
                          color: Colors.white,
                          height: 1.2,
                          fontWeight: FontWeight.w600,
                          fontSize: context.safeSp(13),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.appText.caption.copyWith(
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 12),

            /// ORIGEM
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              // decoration: BoxDecoration(
              //   color: Colors.white.withValues(alpha: 0.04),
              //   borderRadius: BorderRadius.circular(12),
              //   border: Border.all(
              //     color: Colors.white.withValues(alpha: 0.06),
              //   ),
              // ),
              child: Row(
                children: [
                  if (isPlatformGenerated) ...[
                    Image.asset(
                      "assets/images/logo_white.png",
                      width: IconSizes.md,
                    )
                  ] else ...[
                    Icon(
                      Icons.group,
                      color: Colors.white.withValues(alpha: 0.6),
                      size: IconSizes.sm,
                    ),
                  ],
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      isPlatformGenerated ? "Civi" : "Comunidade",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appText.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.75),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // HighlightIcon(
                  //   radius: 10,
                  //   containerSize: IconContainerSizes.xs,
                  //   icon: Icon(
                  //     Icons.share_outlined,
                  //     size: IconSizes.xxs,
                  //     color: Colors.white.withValues(alpha: 0.7),
                  //   ),
                  // ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            /// DESCRIÇÃO
            Expanded(
              child: Container(
                width: context.screenWidth,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.03),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                child: Center(
                  child: Text(
                    howTo ?? 'Não informado como aconteceu!',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.appText.caption.copyWith(
                      fontSize: 11.sp,
                      color: Colors.white.withValues(alpha: 0.65),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
