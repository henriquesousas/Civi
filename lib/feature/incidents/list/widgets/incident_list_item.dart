import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_date.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_image.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_code.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_location.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_protocol.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_how_to.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncidentListItem extends StatelessWidget {
  final IncidentOutput incident;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double width;
  final VoidCallback? onPressed;
  final bool isPress;
  final bool isLoading;

  const IncidentListItem({
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed != null
            ? () {
                HapticFeedback.lightImpact();
                onPressed!();
              }
            : null,
        borderRadius: BorderRadius.circular(24),
        splashColor: context.primaryColor.withValues(alpha: 0.06),
        highlightColor: context.primaryColor.withValues(alpha: 0.05),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(RadiusSize.lg)),
            boxShadow: [
              BoxShadow(
                color: Color(0x142B5BEE),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
            // ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IncidentImage(images: incident.product.images),
                    Expanded(
                      child: Column(
                        spacing: 7,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IncidentTitle(title: incident.product.name),
                          IncidentLocation(local: incident.local),
                          IncidentDate(occurreAt: incident.occurredAt),
                          IncidentCode(code: incident.product.code),
                        ],
                      ),
                    ),
                  ],
                ),
                if (!isLoading) ...[
                  const SizedBox(height: SpacingSize.lg),
                  IncidentHowTo(howTo: incident.howTo),
                  const SizedBox(height: SpacingSize.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 5,
                    children: [
                      IncidentProtocol(
                        protocolNumber: incident.alertId,
                      ),
                      // IncidentCode(code: incident.product.code),
                      StatusBadge(style: StatusStyle.from(incident.status))
                    ],
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
