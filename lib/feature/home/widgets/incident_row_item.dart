import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/old_core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/old_core/extension/date_extension.dart';
import 'package:flutter/material.dart';

class IncidentRowItem extends StatelessWidget {
  final IncidentOutput incident;
  final VoidCallback onTap;

  const IncidentRowItem({
    super.key,
    required this.incident,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CustomNetworkImage(
            //   width: ImageSize.sm,
            //   height: ImageSize.sm,
            //   radius: RadiusSize.md,
            //   imageUrl: incident.product.images.isNotEmpty
            //       ? incident.product.images.first.value
            //       : '',
            // ),
            // CustomNetworkImage(
            //   width: ImageSize.sm,
            //   height: ImageSize.sm,
            //   radius: RadiusSize.md,
            //   customErrorWidget: Icon(
            //     Icons.phone_android,
            //     size: IconSizes.xl,
            //     color: context.onSurface,
            //   ),
            //   imageUrl: incident.product.images.isNotEmpty
            //       ? incident.product.images.first.value
            //       : '',
            // ),
            if (incident.product?.type != ItemType.phone.name) ...[
              CustomNetworkImage(
                width: ImageSize.xs,
                height: ImageSize.xs,
                radius: RadiusSize.md,
                imageUrl: incident.product!.images.isNotEmpty
                    ? incident.product!.images.first.value
                    : '',
              ),
            ],
            if (incident.product?.type == ItemType.phone.name) ...[
              HighlightIcon(
                containerSize: IconSizes.xxl,
                icon: const Icon(Icons.phone_android),
              ),
            ],

            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getCode(incident),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w900,
                      color: context.onSurface,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Roubado ${incident.occurredAt.timeAgo()} • ${_getRegion(incident)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: context.secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.verified_rounded,
              color: incident.visibilty ? AppColors.success : AppColors.grey,
              size: IconSizes.sm,
            ),
          ],
        ),
      ),
    );
  }

  String _getRegion(IncidentOutput incident) {
    if (incident.local == null) return 'Região não definida';
    final region = "${incident.local!.city} - ${incident.local!.state} ";
    return region;
  }

  String _getCode(IncidentOutput incident) {
    if (incident.product?.type != ItemType.phone.name) {
      return "${incident.product?.name} • ${incident.product?.code}";
    }
    return "${incident.product?.name} • ${incident.product?.color}";
  }
}
