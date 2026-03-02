import 'package:flutter/material.dart';

/* ====================== MODELS ====================== */

enum RiskLevel { low, moderate, high, critical }

class RegionStatus {
  final String localityLabel; // "Osasco • SP"
  final String updateLabel; // "Atualizado há 5 min"
  final String periodLabel; // "Últimas 24h / Últimos 30 dias"

  final RiskLevel level;
  final int score; // 0..100
  final double changePct7d; // -9.2 = caiu

  final List<RiskDriver> drivers; // principais fatores
  final RecentEvidence? evidence; // aviso de evidência recente

  const RegionStatus({
    required this.localityLabel,
    required this.updateLabel,
    required this.periodLabel,
    required this.level,
    required this.score,
    required this.changePct7d,
    required this.drivers,
    required this.evidence,
  });
}

class RiskDriver {
  final String label; // "Roubo de celular"
  final String value; // "↑ 18%"
  final bool positiveUp; // true quando aumentou (piorou)
  final IconData icon;

  const RiskDriver({
    required this.label,
    required this.value,
    required this.positiveUp,
    required this.icon,
  });
}

enum EvidenceKind { robbery, theft, recovered }

class RecentEvidence {
  final EvidenceKind kind;
  final String title; // "Roubo confirmado"
  final String subtitle; // "Há 2h • Centro"
  final String details; // "Ocorrência verificada..."
  final bool verified; // evidenciado/verificado

  const RecentEvidence({
    required this.kind,
    required this.title,
    required this.subtitle,
    required this.details,
    required this.verified,
  });
}

/* ====================== SCREEN ====================== */

class TesteHome2 extends StatefulWidget {
  const TesteHome2({super.key});

  @override
  State<TesteHome2> createState() => _TesteHome2State();
}

class _TesteHome2State extends State<TesteHome2> {
  // ===== Visual tokens (mesma vibe premium)
  static const _bg = Color(0xFFF5F7FD);
  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _divider = Color(0xFFE9EEF8);
  static const _primary = Color(0xFF2B5BEE);

  // Mock: localização atual (trocar por GPS + reverse geocode)
  String currentLocation = "Osasco • SP";
  String lastUpdate = "Atualizado há 5 min";

  // Mock: status da região (trocar por API)
  late RegionStatus status = RegionStatus(
    localityLabel: currentLocation,
    updateLabel: lastUpdate,
    periodLabel: "Últimas 24h",
    level: RiskLevel.high, // teste: mude para low para ver como fica
    score: 72,
    changePct7d: 12.4,
    drivers: const [
      RiskDriver(
        label: "Roubo de celular",
        value: "↑ 18%",
        positiveUp: true,
        icon: Icons.smartphone_rounded,
      ),
      RiskDriver(
        label: "Roubo de veículo",
        value: "↑ 9%",
        positiveUp: true,
        icon: Icons.directions_car_rounded,
      ),
      RiskDriver(
        label: "Furto de moto",
        value: "↓ 6%",
        positiveUp: false,
        icon: Icons.two_wheeler_rounded,
      ),
    ],
    evidence: const RecentEvidence(
      kind: EvidenceKind.robbery,
      title: "Alerta de evidência recente",
      subtitle: "Há 2h • Centro",
      details:
          "Foi identificado um roubo nesta localidade. Recomendamos atenção redobrada em deslocamentos e pontos de maior fluxo.",
      verified: true,
    ),
  );

  Color _riskColor(RiskLevel level) => switch (level) {
        RiskLevel.low => const Color(0xFF16A34A),
        RiskLevel.moderate => const Color(0xFFF59E0B),
        RiskLevel.high => const Color(0xFFEF4444),
        RiskLevel.critical => const Color(0xFFB91C1C),
      };

  String _riskLabel(RiskLevel level) => switch (level) {
        RiskLevel.low => "Baixo",
        RiskLevel.moderate => "Moderado",
        RiskLevel.high => "Alto",
        RiskLevel.critical => "Crítico",
      };

  String _changeLabel(double pct) {
    final arrow = pct >= 0 ? "↑" : "↓";
    final abs = pct.abs().toStringAsFixed(1).replaceAll('.', ',');
    return "$arrow $abs% (7 dias)";
  }

  String _headlineByLevel(RiskLevel level) => switch (level) {
        RiskLevel.low =>
          "Região estável no período. Mantenha atenção em horários de pico.",
        RiskLevel.moderate =>
          "Atenção: houve sinais de aumento em alguns tipos de ocorrência.",
        RiskLevel.high =>
          "Atenção redobrada: aumento relevante de ocorrências recentes.",
        RiskLevel.critical =>
          "Situação crítica: evite rotas isoladas e prefira locais movimentados.",
      };

  void _toast(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  Future<void> _openLocationPicker() async {
    // Aqui você troca por: filtro UF/Cidade ou mapa
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _LocationPickerSheet(
        current: currentLocation,
        options: const [
          "Osasco • SP",
          "São Paulo • SP",
          "Barueri • SP",
          "Guarulhos • SP",
        ],
      ),
    );

    if (selected != null && selected != currentLocation) {
      setState(() {
        currentLocation = selected;
        status = RegionStatus(
          localityLabel: currentLocation,
          updateLabel: "Atualizado agora",
          periodLabel: status.periodLabel,
          level: status.level,
          score: status.score,
          changePct7d: status.changePct7d,
          drivers: status.drivers,
          evidence: status.evidence,
        );
      });
      _toast("Local alterado para $selected");
    }
  }

  void _openHowItWorks() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _HowItWorksSheet(),
    );
  }

  void _openPanicSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _PanicQuickSheet(
        onReport: () {
          Navigator.pop(context);
          _toast("Abrir tela de registrar ocorrência");
        },
        onCallPolice: () {
          Navigator.pop(context);
          _toast("Ligar 190 (exemplo)");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final riskColor = _riskColor(status.level);
    final label = _riskLabel(status.level);

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: _surface,
        surfaceTintColor: _surface,
        titleSpacing: 16,
        title: const Text(
          "Status da região",
          style: TextStyle(
            color: _ink,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            tooltip: "Trocar local",
            onPressed: _openLocationPicker,
            icon: const Icon(Icons.place_outlined, color: _ink),
          ),
          IconButton(
            tooltip: "Como calculamos",
            onPressed: _openHowItWorks,
            icon: const Icon(Icons.info_outline, color: _ink),
          ),
          const SizedBox(width: 6),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openPanicSheet(context),
        icon: const Icon(Icons.sos_rounded),
        label: const Text(
          "SOS",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: const Color(0xFFEF4444),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          LocationCard(
            location: currentLocation,
            updateLabel: lastUpdate,
            onChange: _openLocationPicker,
          ),
          const SizedBox(height: 14),
          RegionStatusCard(
            locality: status.localityLabel,
            periodLabel: status.periodLabel,
            level: status.level,
            score: status.score,
            onHowItWorks: _openHowItWorks,
          ),
          const SizedBox(height: 12),
          TrendCard(
            changeLabel: _changeLabel(status.changePct7d),
            level: status.level,
          ),
          const SizedBox(height: 12),
          if (status.evidence != null) ...[
            EvidenceCalmCard(
              evidence: status.evidence!,
              onTap: () => _toast("Abrir detalhes do aviso (exemplo)"),
            ),
            const SizedBox(height: 12),
          ],
          DriversCard(
            drivers: status.drivers,
          ),
        ],
      ),
    );
  }
}

/* ====================== COMPONENTS ====================== */

class LocationCard extends StatelessWidget {
  final String location;
  final String updateLabel;
  final VoidCallback onChange;

  const LocationCard({
    super.key,
    required this.location,
    required this.updateLabel,
    required this.onChange,
  });

  // tokens locais (iguais aos seus)
  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.my_location_rounded, color: _primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sua localização",
                    style: TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: const TextStyle(
                      color: _ink,
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    updateLabel,
                    style: const TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 108, // ajuste fino (96–120)
              height: 44,
              child: OutlinedButton.icon(
                onPressed: onChange,
                icon: const Icon(Icons.swap_horiz_rounded, size: 18),
                label: const Text(
                  "Trocar",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: _ink,
                  side: const BorderSide(color: _border),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
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

// class _LocationCard2 extends StatelessWidget {
//   final String location;
//   final String updateLabel;
//   final VoidCallback onChange;

//   const _LocationCard2({
//     required this.location,
//     required this.updateLabel,
//     required this.onChange,
//   });

//   static const _bg = Color(0xFFF5F7FD);
//   static const _surface = Colors.white;
//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);
//   static const _divider = Color(0xFFE9EEF8);
//   static const _primary = Color(0xFF2B5BEE);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: _surface,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x142B5BEE),
//             blurRadius: 16,
//             offset: Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(14),
//         child: Row(
//           children: [
//             Container(
//               width: 44,
//               height: 44,
//               decoration: BoxDecoration(
//                 color: _primary.withOpacity(0.10),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: const Icon(Icons.my_location_rounded, color: _primary),
//             ),
//             const SizedBox(width: 12),
//             // Text("dasadsa"),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Sua localização",
//                     style: TextStyle(
//                       color: _muted,
//                       fontWeight: FontWeight.w800,
//                       fontSize: 12,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     location,
//                     style: const TextStyle(
//                       color: _ink,
//                       fontWeight: FontWeight.w900,
//                       fontSize: 15,
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                   Text(
//                     updateLabel,
//                     style: const TextStyle(
//                       color: _muted,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12.2,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             OutlinedButton.icon(
//               onPressed: onChange,
//               icon: const Icon(Icons.swap_horiz_rounded, size: 18),
//               label: const Text(
//                 "Trocar",
//                 style: TextStyle(fontWeight: FontWeight.w900),
//               ),
//               style: OutlinedButton.styleFrom(
//                 foregroundColor: _ink,
//                 side: const BorderSide(color: _border),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _RiskHeroCard extends StatelessWidget {
  final String locality;
  final String periodLabel;
  final String levelLabel;
  final RiskLevel level;
  final int score;
  final String changeLabel;
  final String headline;
  final Color riskColor;
  final VoidCallback onHowItWorks;
  final VoidCallback onSeeDetails;
  final List<RiskDriver> drivers;

  const _RiskHeroCard({
    required this.locality,
    required this.periodLabel,
    required this.levelLabel,
    required this.level,
    required this.score,
    required this.changeLabel,
    required this.headline,
    required this.riskColor,
    required this.onHowItWorks,
    required this.onSeeDetails,
    required this.drivers,
  });

  static const _surface = _TesteHome2State._surface;
  static const _ink = _TesteHome2State._ink;
  static const _muted = _TesteHome2State._muted;
  static const _border = _TesteHome2State._border;
  static const _divider = _TesteHome2State._divider;
  static const _primary = _TesteHome2State._primary;

  bool get _isEmphasis =>
      level == RiskLevel.high ||
      level == RiskLevel.critical ||
      level == RiskLevel.low;

  String get _emphasisLabel => (level == RiskLevel.low)
      ? "Área mais tranquila"
      : (level == RiskLevel.critical)
          ? "Risco crítico"
          : "Atenção redobrada";

  IconData get _emphasisIcon => (level == RiskLevel.low)
      ? Icons.verified_rounded
      : Icons.warning_amber_rounded;

  @override
  Widget build(BuildContext context) {
    // faixa superior com destaque conforme risco
    final topStripe = Container(
      height: 10,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            riskColor.withOpacity(0.90),
            riskColor.withOpacity(0.25),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Column(
          children: [
            topStripe,
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
              child: Column(
                children: [
                  // Header
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: riskColor.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(18),
                          border:
                              Border.all(color: riskColor.withOpacity(0.22)),
                        ),
                        child: Icon(Icons.shield_rounded, color: riskColor),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Periculosidade",
                              style: TextStyle(
                                color: _ink,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.place_outlined,
                                    size: 14, color: _muted),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    "$locality • $periodLabel",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: _muted,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _Pill(text: levelLabel, color: riskColor),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Emphasis row (aparece quando alto/crítico OU baixo)
                  if (_isEmphasis) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: riskColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: riskColor.withOpacity(0.18)),
                      ),
                      child: Row(
                        children: [
                          Icon(_emphasisIcon, color: riskColor),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _emphasisLabel,
                              style: TextStyle(
                                color: riskColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 13.5,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: onHowItWorks,
                            child: const Text(
                              "Entenda",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],

                  // Metrics
                  Row(
                    children: [
                      Expanded(
                        child: _MetricBox(
                          title: "Índice",
                          value: "$score/100",
                          subtitle: "quanto maior, maior o risco",
                          accent: _primary,
                          icon: Icons.speed_rounded,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _MetricBox(
                          title: "Variação",
                          value: changeLabel,
                          subtitle: "tendência recente",
                          accent: riskColor,
                          icon: Icons.trending_up_rounded,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  const Divider(height: 1, thickness: 1, color: _divider),
                  const SizedBox(height: 12),

                  // Headline (status humano, institucional)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      headline,
                      style: const TextStyle(
                        color: _muted,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Drivers
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Principais fatores",
                      style: TextStyle(
                        color: _muted,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children:
                        drivers.map((d) => _DriverRow(driver: d)).toList(),
                  ),

                  const SizedBox(height: 12),

                  // CTA
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: onHowItWorks,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: _ink,
                            side: const BorderSide(color: _border),
                            backgroundColor: _surface,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            "Como calculamos",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onSeeDetails,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            "Ver detalhes",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EvidenceAlertCard extends StatelessWidget {
  final RecentEvidence evidence;
  final VoidCallback onTap;

  const _EvidenceAlertCard({
    required this.evidence,
    required this.onTap,
  });

  static const _surface = _TesteHome2State._surface;
  static const _ink = _TesteHome2State._ink;
  static const _muted = _TesteHome2State._muted;
  static const _border = _TesteHome2State._border;

  Color get _color => switch (evidence.kind) {
        EvidenceKind.robbery => const Color(0xFFEF4444),
        EvidenceKind.theft => const Color(0xFFF59E0B),
        EvidenceKind.recovered => const Color(0xFF16A34A),
      };

  IconData get _icon => switch (evidence.kind) {
        EvidenceKind.robbery => Icons.report_gmailerrorred_rounded,
        EvidenceKind.theft => Icons.warning_amber_rounded,
        EvidenceKind.recovered => Icons.verified_rounded,
      };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Ink(
        decoration: BoxDecoration(
          color: _surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: _color.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: _color.withOpacity(0.22)),
                    ),
                    child: Icon(_icon, color: _color),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                evidence.title,
                                style: const TextStyle(
                                  color: _ink,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14.5,
                                ),
                              ),
                            ),
                            if (evidence.verified)
                              _Pill(text: "Evidenciado", color: _color),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          evidence.subtitle,
                          style: const TextStyle(
                            color: _muted,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: _muted),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FD),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _border),
                ),
                child: Text(
                  evidence.details,
                  style: const TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusActionsCard extends StatelessWidget {
  final Color riskColor;
  final String levelLabel;
  final VoidCallback onReport;
  final VoidCallback onSearch;
  final VoidCallback onTips;

  const _StatusActionsCard({
    required this.riskColor,
    required this.levelLabel,
    required this.onReport,
    required this.onSearch,
    required this.onTips,
  });

  static const _surface = _TesteHome2State._surface;
  static const _ink = _TesteHome2State._ink;
  static const _muted = _TesteHome2State._muted;
  static const _border = _TesteHome2State._border;
  static const _primary = _TesteHome2State._primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: _primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.insights_rounded, color: _primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ações recomendadas",
                        style: TextStyle(
                          color: _ink,
                          fontWeight: FontWeight.w900,
                          fontSize: 14.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Status atual: $levelLabel",
                        style: const TextStyle(
                          color: _muted,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                _Pill(text: "Ao vivo", color: riskColor),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _ActionTile(
                    icon: Icons.add_alert_outlined,
                    title: "Reportar",
                    subtitle: "Nova ocorrência",
                    accent: const Color(0xFF16A34A),
                    onTap: onReport,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionTile(
                    icon: Icons.search_rounded,
                    title: "Pesquisar",
                    subtitle: "Placa / IMEI",
                    accent: _primary,
                    onTap: onSearch,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _ActionTile(
              icon: Icons.shield_outlined,
              title: "Dicas de prevenção",
              subtitle: "Recomendações para a região",
              accent: const Color(0xFF6B7280),
              onTap: onTips,
              fullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color accent;
  final VoidCallback onTap;
  final bool fullWidth;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accent,
    required this.onTap,
    this.fullWidth = false,
  });

  static const _ink = _TesteHome2State._ink;
  static const _muted = _TesteHome2State._muted;
  static const _border = _TesteHome2State._border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: fullWidth ? double.infinity : null,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FD),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _border),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: accent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: accent, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: _ink,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.2,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: _muted),
          ],
        ),
      ),
    );
  }
}

class _DriverRow extends StatelessWidget {
  final RiskDriver driver;
  const _DriverRow({required this.driver});

  static const _ink = _TesteHome2State._ink;
  static const _muted = _TesteHome2State._muted;
  static const _border = _TesteHome2State._border;

  Color get _valueColor {
    if (driver.positiveUp) return const Color(0xFFEF4444);
    return const Color(0xFF16A34A);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _border),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: _valueColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(driver.icon, color: _valueColor, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              driver.label,
              style: const TextStyle(
                color: _ink,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
          ),
          Text(
            driver.value,
            style: TextStyle(
              color: _valueColor,
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricBox extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color accent;
  final IconData icon;

  const _MetricBox({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.accent,
    required this.icon,
  });

  static const _ink = _TesteHome2State._ink;
  static const _muted = _TesteHome2State._muted;
  static const _border = _TesteHome2State._border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: accent, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _ink,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  final Color color;

  const _Pill({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(0.22)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: color,
          fontSize: 12,
        ),
      ),
    );
  }
}

/* ====================== SHEETS ====================== */

class _LocationPickerSheet extends StatelessWidget {
  final String current;
  final List<String> options;

  const _LocationPickerSheet({
    required this.current,
    required this.options,
  });

  static const _ink = _TesteHome2State._ink;
  static const _muted = _TesteHome2State._muted;
  static const _primary = _TesteHome2State._primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EAF6),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: const [
                  Icon(Icons.place_outlined, color: _primary),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Trocar local",
                      style: TextStyle(
                        color: _ink,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Atual: $current",
                  style: const TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ...options.map(
                (o) => ListTile(
                  onTap: () => Navigator.of(context).pop(o),
                  leading: Icon(
                    o == current
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: _primary,
                  ),
                  title: Text(
                    o,
                    style: const TextStyle(
                      color: _ink,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HowItWorksSheet extends StatelessWidget {
  const _HowItWorksSheet();

  static const _ink = _TesteHome2State._ink;
  static const _muted = _TesteHome2State._muted;
  static const _primary = _TesteHome2State._primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EAF6),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: const [
                  Icon(Icons.info_outline, color: _primary),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Como calculamos o índice",
                      style: TextStyle(
                        color: _ink,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const _HowItem(
                title: "1) Volume de ocorrências",
                text:
                    "Considera quantas ocorrências foram reportadas na região no período selecionado.",
              ),
              const SizedBox(height: 8),
              const _HowItem(
                title: "2) Recência e proximidade",
                text:
                    "Ocorrências mais recentes e próximas do local consultado recebem peso maior.",
              ),
              const SizedBox(height: 8),
              const _HowItem(
                title: "3) Tipo de evento",
                text:
                    "Alguns tipos de ocorrência podem ter pesos diferentes (roubo/furto/recuperado).",
              ),
              const SizedBox(height: 8),
              const _HowItem(
                title: "4) Evidências e verificação",
                text:
                    "Quando disponível, sinais de evidência/verificação aumentam a confiabilidade do indicador.",
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "Entendi",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HowItem extends StatelessWidget {
  final String title;
  final String text;

  const _HowItem({required this.title, required this.text});

  static const _ink = _TesteHome2State._ink;
  static const _muted = _TesteHome2State._muted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: _ink,
              fontWeight: FontWeight.w900,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: const TextStyle(
              color: _muted,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

class RegionStatusCard extends StatelessWidget {
  final String locality;
  final String periodLabel;
  final RiskLevel level;
  final int score;
  final VoidCallback onHowItWorks;

  const RegionStatusCard({
    super.key,
    required this.locality,
    required this.periodLabel,
    required this.level,
    required this.score,
    required this.onHowItWorks,
  });

  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _primary = Color(0xFF2B5BEE);

  Color _levelColor() => switch (level) {
        RiskLevel.low => const Color(0xFF16A34A),
        RiskLevel.moderate => const Color(0xFFF59E0B),
        RiskLevel.high => const Color(0xFFEF4444),
        RiskLevel.critical => const Color(0xFFB91C1C),
      };

  String _levelLabel() => switch (level) {
        RiskLevel.low => "Baixo",
        RiskLevel.moderate => "Moderado",
        RiskLevel.high => "Elevado",
        RiskLevel.critical => "Crítico",
      };

  // copy “calma”, institucional
  String _statusMessage() => switch (level) {
        RiskLevel.low =>
          "Cenário estável no período. Mantenha cuidados básicos no dia a dia.",
        RiskLevel.moderate =>
          "Há variações pontuais. Atenção em horários e locais de maior fluxo.",
        RiskLevel.high =>
          "Registros acima do normal. Planeje rotas e evite distrações.",
        RiskLevel.critical =>
          "Registros muito altos. Prefira locais movimentados e rotas conhecidas.",
      };

  @override
  Widget build(BuildContext context) {
    final c = _levelColor();

    return _BaseCard(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.assessment_rounded, color: _primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Status da região",
                        style: TextStyle(
                          color: _ink,
                          fontWeight: FontWeight.w900,
                          fontSize: 14.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "$locality • $periodLabel",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: _muted,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ),
                _Pill(text: _levelLabel(), color: c),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FD),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: _border),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _statusMessage(),
                      style: const TextStyle(
                        color: _muted,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "$score/100",
                    style: TextStyle(
                      color: c,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onHowItWorks,
                child: const Text(
                  "Como funciona",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DriversCard extends StatelessWidget {
  final List<RiskDriver> drivers;
  const DriversCard({super.key, required this.drivers});

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
        child: Column(
          children: [
            Row(
              children: const [
                Icon(Icons.analytics_outlined, color: _muted),
                SizedBox(width: 8),
                Text(
                  "Indicadores",
                  style: TextStyle(
                    color: _ink,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...drivers.map((d) => _DriverRow(driver: d)).toList(),
            // const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _BaseCard extends StatelessWidget {
  final Widget child;
  const _BaseCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class EvidenceCalmCard extends StatelessWidget {
  final RecentEvidence evidence;
  final VoidCallback onTap;

  const EvidenceCalmCard({
    super.key,
    required this.evidence,
    required this.onTap,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  Color get _color => switch (evidence.kind) {
        EvidenceKind.robbery => const Color(0xFFEF4444),
        EvidenceKind.theft => const Color(0xFFF59E0B),
        EvidenceKind.recovered => const Color(0xFF16A34A),
      };

  IconData get _icon => switch (evidence.kind) {
        EvidenceKind.robbery => Icons.notifications_active_outlined,
        EvidenceKind.theft => Icons.notifications_outlined,
        EvidenceKind.recovered => Icons.verified_outlined,
      };

  String get _titleCalm => "Aviso recente na área"; // título neutro

  @override
  Widget build(BuildContext context) {
    final c = _color;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: _BaseCard(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: c.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: c.withOpacity(0.18)),
                    ),
                    child: Icon(_icon, color: c),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _titleCalm,
                          style: const TextStyle(
                            color: _ink,
                            fontWeight: FontWeight.w900,
                            fontSize: 14.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          evidence.subtitle,
                          style: const TextStyle(
                            color: _muted,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (evidence.verified) _Pill(text: "Verificado", color: c),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FD),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _border),
                ),
                child: Text(
                  evidence.details,
                  style: const TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrendCard extends StatelessWidget {
  final String changeLabel;
  final RiskLevel level;

  const TrendCard({
    super.key,
    required this.changeLabel,
    required this.level,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  Color _accent() => switch (level) {
        RiskLevel.low => const Color(0xFF16A34A),
        RiskLevel.moderate => const Color(0xFFF59E0B),
        RiskLevel.high => const Color(0xFFEF4444),
        RiskLevel.critical => const Color(0xFFB91C1C),
      };

  @override
  Widget build(BuildContext context) {
    final a = _accent();

    return _BaseCard(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: a.withOpacity(0.10),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.trending_up_rounded, color: a),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Tendência",
                    style: TextStyle(
                      color: _ink,
                      fontWeight: FontWeight.w900,
                      fontSize: 14.5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Comparação dos últimos 7 dias",
                    style: TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              changeLabel,
              style: TextStyle(
                color: a,
                fontWeight: FontWeight.w900,
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PanicQuickSheet extends StatelessWidget {
  final VoidCallback onReport;
  final VoidCallback onCallPolice;

  const _PanicQuickSheet({
    required this.onReport,
    required this.onCallPolice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EAF6),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: const [
                  Icon(Icons.sos_rounded, color: Color(0xFFEF4444)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Acesso rápido",
                      style: TextStyle(
                        color: Color(0xFF1F2A44),
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FD),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFE6EAF6)),
                ),
                child: const Text(
                  "Se você presenciou uma ocorrência, registre rapidamente ou acione ajuda.",
                  style: TextStyle(
                    color: Color(0xFF8A96C8),
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Registrar ocorrência (primário)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onReport,
                  icon: const Icon(Icons.add_alert_outlined),
                  label: const Text(
                    "Registrar ocorrência",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B5BEE),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Ligar 190 (secundário)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: onCallPolice,
                  icon: const Icon(Icons.local_police_outlined),
                  label: const Text(
                    "Ligar para 190",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF1F2A44),
                    side: const BorderSide(color: Color(0xFFE6EAF6)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
