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
  final String assetImagePath;
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
    required this.assetImagePath,
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
  }

  @override
  Widget build(BuildContext context) {
    final subtitle = '$locationLabel • $timeLabel • $distanceLabel';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 3),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // color: const Color(0xFF111318),
          color: context.primaryBgCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              // color: Colors.white.withValues(alpha: 0.05),
              color: context.outline,
              width: 1),
          boxShadow: const [
            // BoxShadow(
            //   color: Colors.black.withValues(alpha: 0.6),
            //   blurRadius: 24,
            //   offset: const Offset(0, 12),
            // ),
            // BoxShadow(
            //   color: _badgeColor.withValues(alpha: 0.08),
            //   blurRadius: 20,
            //   spreadRadius: -4,
            // ),
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 16,
              offset: Offset(0, 8),
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
                      width: ImageSize.xs,
                      height: ImageSize.xs,
                      imageUrl: coverImageUrl,
                      customErrorWidget: CiviImageCard(
                        assetPath: assetImagePath,
                        width: ImageSize.sm,
                        height: ImageSize.sm,
                      ),
                    ),
                  ),
                ] else ...[
                  CiviImageCard(
                    assetPath: coverImageUrl!,
                    width: ImageSize.xs,
                    height: ImageSize.xs,
                  ),
                ],
                const SizedBox(width: 10),

                /// TEXTO
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              ],
                            ),
                          ),

                          const SizedBox(width: 5),

                          /// DIREITA (ação)
                          GestureDetector(
                            onTap: onShareTap,
                            child: HighlightIcon(
                              radius: 10,
                              bgColor: context.outlineVariantColor,
                              containerSize: IconContainerSizes.sm,
                              icon: Icon(
                                Icons.share_outlined,
                                size: IconSizes.xs,
                                // color: Colors.white.withValues(alpha: 0.7),
                                color: context.secondaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.appText.headerlg.copyWith(
                          color: context.primaryTextColor,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          // fontSize: context.safeSp(13),
                        ),
                      ),
                      // const SizedBox(height: 6),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.appText.caption.copyWith(
                          color: context.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // const SizedBox(height: 12),

            /// ORIGEM
            Row(
              children: [
                //
                if (isPlatformGenerated) ...[
                  Container(
                    width: IconContainerSizes.sm,
                    height: IconContainerSizes.sm,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/spoken_logo_v2.png",
                      width: IconSizes.xs,
                    ),
                  )
                ] else ...[
                  Container(
                    width: IconContainerSizes.sm,
                    height: IconContainerSizes.sm,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.group,
                      size: IconSizes.xs,
                      // color: Colors.white.withValues(alpha: 0.6),
                      color: context.primaryTextColor,
                    ),
                  )
                ],
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    isPlatformGenerated ? "Civi" : "Comunidade",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.appText.caption.copyWith(
                      // color: Colors.white.withValues(alpha: 0.75),
                      color: context.secondaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
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
                  // color: Colors.white.withValues(alpha: 0.03),
                  color: context.primaryBgCardLow.withValues(alpha: 0.8),
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
                      // color: Colors.white.withValues(alpha: 0.65),
                      color: context.secondaryTextColor,
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
