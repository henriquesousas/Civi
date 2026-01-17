import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/incident_summary_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentSummaryWidget extends StatelessWidget {
  const IncidentSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.description,
                size: Dimens.size20.w,
                color: Colors.white.withValues(alpha: 0.9),
              ),
              const SizedBox(width: 8),
              Text(
                "RESUMO DO INCIDENTE",
                style: context.appTextStyles.caption1Style.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.9),
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          //widget.incidentData['tipo'] ?? "Roubo"
          const IncidentSummaryTileWidget(
            label: "TIPO:",
            value: "Roubo",
          ),
          const Divider(color: Colors.white24, height: 20),
          // widget.incidentData['local'] ?? "Não informado"
          const IncidentSummaryTileWidget(
            label: "LOCAL:",
            value: "Osasco - São Paulo",
          ),
          const Divider(color: Colors.white24, height: 20),
          const IncidentSummaryTileWidget(
            label: "HORÁRIO:",
            value: "Agora",
            // value: widget.incidentData['data'] != null
            //     ? _formatTime(widget.incidentData['data'])
            //     : "Agora",
          ),
        ],
      ),
    );
  }
}
