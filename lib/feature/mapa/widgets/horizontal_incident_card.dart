import 'package:deehelp/core/extension/size_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/core/ui/widgets/image/export_image.dart';
import 'package:deehelp/feature/mapa/reported_by.dart';
import 'package:deehelp/feature/mapa/widgets/type_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalIncidentCard extends StatelessWidget {
  final String incidentType;
  final String title;
  final String locationLabel;
  final String timeLabel;
  final String distanceLabel;
  final ReportedBy reportedBy;
  final String coverImageUrl;
  final int confirmations;
  final List<String> participantAvatarUrls;
  final VoidCallback? onTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onBookmarkTap;

  const HorizontalIncidentCard({
    super.key,
    required this.incidentType,
    required this.title,
    required this.locationLabel,
    required this.timeLabel,
    required this.distanceLabel,
    required this.reportedBy,
    required this.coverImageUrl,
    required this.confirmations,
    required this.participantAvatarUrls,
    this.onTap,
    this.onShareTap,
    this.onBookmarkTap,
  });

  Color get _badgeColor {
    switch (incidentType.toLowerCase()) {
      case 'roubo':
        return AppColors.danger;
      case 'furto':
        return const Color(0xFFF59E0B);
      case 'suspeito':
        return const Color(0xFF7C3AED);
      case 'recuperado':
        return AppColors.success;
      default:
        return AppColors.primaryColor;
    }
  }

  IconData get _incidentIcon {
    switch (incidentType.toLowerCase()) {
      case 'roubo':
        return Icons.local_police_outlined;
      case 'furto':
        return Icons.warning_amber_rounded;
      case 'suspeito':
        return Icons.visibility_outlined;
      case 'recuperado':
        return Icons.verified_rounded;
      default:
        return Icons.report_gmailerrorred_rounded;
    }
  }

  String get _reportedBy {
    switch (reportedBy) {
      case ReportedBy.community:
        return "Postado pela comunidade";
      default:
        return "Postado pela plataforma";
    }
  }

  IconData get _reportedByIcon {
    switch (reportedBy) {
      case ReportedBy.community:
        return Icons.verified_rounded;
      default:
        return Icons.verified;
    }
  }

  @override
  Widget build(BuildContext context) {
    final subtitle = '$locationLabel • $timeLabel • $distanceLabel';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 300,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE8EDF5),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// topo
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: CustomNetworkImage(
                    width: ImageSize.sm,
                    height: ImageSize.sm,
                    imageUrl: coverImageUrl,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          TypeBadge(
                            label: incidentType,
                            textColor: Colors.white,
                            bgColor: _badgeColor.withValues(alpha: 0.92),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: _badgeColor.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _incidentIcon,
                                  size: IconSizes.xs,
                                  color: _badgeColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Alerta ativo',
                                  style: context.appText.caption.copyWith(
                                    fontSize: 10.sp,
                                    color: _badgeColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.appText.headermd.copyWith(
                          height: 1.15,
                          color: const Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.appText.caption.copyWith(
                          color: const Color(0xFF6B7280),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 10),

            /// origem do alerta
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE9EEF6),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _reportedByIcon,
                    color: AppColors.grey,
                    size: IconSizes.sm,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _reportedBy,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appText.caption.copyWith(
                        fontSize: 11.sp,
                        color: const Color(0xFF475467),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  HighlightIcon(
                    radius: 9,
                    containerSize: IconContainerSizes.xs,
                    icon: Icon(
                      Icons.share_outlined,
                      size: IconSizes.xxs,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            Container(
              width: context.screenWidth,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE9EEF6),
                ),
              ),
              child: Text(
                "Veio dois homens armados e me rendeream dsa dsad asd sad sadsad sad dasdsadsadsadsds dasd dsadsad",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.appText.caption.copyWith(fontSize: 10.sp),
              ),
            )

            /// rodapé
            // Row(
            //   children: [
            //     // Expanded(
            //     //   child: Row(
            //     //     children: [
            //     //       if (participantAvatarUrls.isNotEmpty)
            //     //         ParticipantsStack(
            //     //           avatarUrls: participantAvatarUrls,
            //     //         ),
            //     //       if (participantAvatarUrls.isNotEmpty)
            //     //         const SizedBox(width: 8),
            //     //       Flexible(
            //     //         child: Text(
            //     //           '$confirmations acompanhando',
            //     //           overflow: TextOverflow.ellipsis,
            //     //           style: context.appText.caption.copyWith(
            //     //             color: const Color(0xFF6B7280),
            //     //             fontWeight: FontWeight.w600,
            //     //           ),
            //     //         ),
            //     //       ),
            //     //     ],
            //     //   ),
            //     // ),
            //     // const SizedBox(width: 8),
            //     // HighlightIcon(
            //     //   radius: 9,
            //     //   containerSize: IconContainerSizes.sm,
            //     //   icon: Icon(
            //     //     Icons.share_outlined,
            //     //     size: IconSizes.sm,
            //     //   ),
            //     // ),
            //     // const SizedBox(width: 6),
            //     // HighlightIcon(
            //     //   radius: 9,
            //     //   containerSize: IconContainerSizes.sm,
            //     //   icon: Icon(
            //     //     Icons.bookmark_border_rounded,
            //     //     size: IconSizes.sm,
            //     //   ),
            //     // ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
