import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/feature/home/v2/recent_alert_top_overlay.dart';
import 'package:deehelp/feature/home/v2/region_status.dart';
import 'package:deehelp/feature/home/v2/widgets/category_incident_horizontal_card.dart';
import 'package:deehelp/feature/home/v2/widgets/community_movement.dart';
import 'package:deehelp/feature/home/v2/widgets/contribute_card.dart';
import 'package:deehelp/feature/home/v2/widgets/location_card.dart';
import 'package:deehelp/feature/home/v2/widgets/recents_incidents_floating_card.dart';
import 'package:deehelp/feature/home/v2/widgets/region_summary_card.dart';
import 'package:deehelp/feature/home/v2/widgets/today_panorama_card.dart';
import 'package:deehelp/feature/home/v2/widgets/waze_alert.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'models.dart';
import 'widgets/community_tips_action_card.dart';

class TesteHomePageAlert extends StatefulWidget {
  const TesteHomePageAlert({super.key});

  @override
  State<TesteHomePageAlert> createState() => _TesteHomePageAlertState();
}

class _TesteHomePageAlertState extends State<TesteHomePageAlert> {
  bool hasEvidence = false;
  final floatingH = 92.0;
  final floatingTop = 12.0;
  final currentLocation = "Osasco • SP";
  final lastUpdate = "Atualizado há 5 min";
  final currentCity = "Osasco • SP";
  String selectedNeighborhood = "Todos"; // chip s
  late RegionStatus status = RegionStatus(
    localityLabel: currentCity,
    updateLabel: lastUpdate,
    periodLabel: "Últimas 24h",
    level: RiskLevel.low,
    score: 72,
    drivers: [
      RiskDriver(
        label: "Roubo de celular",
        value: "18",
        positiveUp: true,
        icon: Icons.smartphone_rounded,
      ),
      RiskDriver(
        label: "Roubo de veículo",
        value: "9",
        positiveUp: true,
        icon: Icons.directions_car_rounded,
      ),
      RiskDriver(
        label: "Furto de moto",
        value: "6",
        positiveUp: false,
        icon: Icons.two_wheeler_rounded,
      ),
    ],
    evidence: const RecentEvidence(
      kind: EvidenceKind.robbery,
      title: "Roubo registrado agora",
      subtitle: "Há 12 min • Centro",
      verified: true,
      distanceKm: 1.8,
      confirmations: 4,
    ),
    today: const TodaySnapshot(total24h: 8, confirmed: 3, analyzing: 2),
    pulse: const CommunityPulse(watchersToday: 23, contributorsToday: 7),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Osasco agora", press: () {}),
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              16,
              // 16 + (hasEvidence ? (floatingH + floatingTop + 10) : 0),
              // 16 + (hasEvidence ? (floatingH + context.topPadding) : 0),
              16 + (hasEvidence ? (context.topPadding * 3) : 0),
              // 16,
              16,
              24,
            ),
            children: [
              LocationCard(
                location: "$currentCity • $selectedNeighborhood",
                updateLabel: lastUpdate,
                onChange: () => {},
              ),
              const SizedBox(height: 12),
              CommunityTipsAndActionsCard(
                onShareRoute: () {},
                tips: const [
                  CommunityTip(
                    icon: Icons.traffic,
                    title: "Trânsito parado? atenção redobrada",
                    subtitle:
                        "Em retornos e sob viadutos, evite ficar exposto e observe ao redor.",
                  ),
                  CommunityTip(
                    icon: Icons.smartphone,
                    title: "Celular fora de vista",
                    subtitle:
                        "Preferir bolso interno/bolsa fechada em pontos de ônibus e semáforos.",
                  ),
                  CommunityTip(
                    icon: Icons.lightbulb,
                    title: "Prefira rotas iluminadas",
                    subtitle:
                        "Evite ruas desertas; se possível, caminhe acompanhado.",
                  ),
                ],
                onSendTip: () {
                  setState(() {
                    WazeAlertController.instance.show(
                        const WazeAlertState(title: "sas", subtitle: "sasa"));
                    AlertVibrationStrong.vibrateStrong();
                    hasEvidence = true;
                  });
                  // showRecentIncidentTopAlertV2(context,
                  //     evidence: status.evidence!, onTap: () {});
                  // abrir modal/tela “Enviar dica”
                  // showModalBottomSheet<ReportEntry>(
                  //   context: context,
                  //   isScrollControlled: false,
                  //   backgroundColor: Colors.transparent,
                  //   builder: (ctx) {
                  //     return const TesteReportyEntryBottomSheet();
                  //   },
                  // );
                },
              ),
              const SizedBox(height: 12),
              TodayPanoramaCardProC(
                title: "Panorama de hoje",
                subtitle: "Resumo coletivo nas últimas 24h",
                total24h: status.today.total24h,
                confirmed: status.today.confirmed,
                analyzing: status.today.analyzing,
              ),
              const SizedBox(height: 12),
              CategoryIncidentHorizontalCardProV2(
                title: "O que mais aconteceu em Osasco",
                subtitle: "Top 3 do período",
                drivers: status.drivers,
                onTapDriver: (d) => {},
              ),
              const SizedBox(height: 12),
              CommunityMovementCardProClean(
                title: "Movimento da comunidade",
                subtitle: "Acompanhamento e contribuições de hoje",
                watchersToday: status.pulse.watchersToday,
                contributorsToday: status.pulse.contributorsToday,
                // onSeeMore: () => {},
              ),
              const SizedBox(height: 12),
              ContributePrimaryCard(onContribute: () => {}),
            ],
          ),
          // if (hasEvidence)
          //   Positioned(
          //     left: 14,
          //     right: 14,
          //     child: WazeLikeCommunityPromptCard(
          //       locationLabel: "Centro • Osasco",
          //       onPrimary: () {},
          //       onClose: () {},
          //     ),
          //   ),
        ],
      ),
    );
  }
}
