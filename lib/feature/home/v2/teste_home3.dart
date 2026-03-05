// import 'package:flutter/material.dart';

// /* ====================== MODELS ====================== */

// enum RiskLevel { low, moderate, high, critical }

// class RegionStatus {
//   final String localityLabel;
//   final String updateLabel;
//   final String periodLabel;

//   final RiskLevel level;
//   final int score; // 0..100

//   // Top 3 (principais ocorrências)
//   final List<RiskDriver> drivers;

//   // Ocorrência mais recente (para topo flutuante)
//   final RecentEvidence? evidence;

//   // NOVO: panorama coletivo do dia
//   final TodaySnapshot today;

//   // NOVO: movimento da comunidade
//   final CommunityPulse pulse;

//   const RegionStatus({
//     required this.localityLabel,
//     required this.updateLabel,
//     required this.periodLabel,
//     required this.level,
//     required this.score,
//     required this.drivers,
//     required this.evidence,
//     required this.today,
//     required this.pulse,
//   });
// }

// class RiskDriver {
//   final String label; // "Roubo de celular"
//   final String value; // "18"
//   final bool positiveUp; // usado só para cor do indicador
//   final IconData icon;

//   const RiskDriver({
//     required this.label,
//     required this.value,
//     required this.positiveUp,
//     required this.icon,
//   });
// }

// enum EvidenceKind { robbery, theft, recovered }

// class RecentEvidence {
//   final EvidenceKind kind;
//   final String title;
//   final String subtitle; // "Há 12 min • Centro"
//   final bool verified;

//   // NOVO (coletivo/preventivo)
//   final double distanceKm; // 1.8
//   final int confirmations; // 4 confirmações da comunidade

//   const RecentEvidence({
//     required this.kind,
//     required this.title,
//     required this.subtitle,
//     required this.verified,
//     required this.distanceKm,
//     required this.confirmations,
//   });
// }

// class TodaySnapshot {
//   final int total24h;
//   final int confirmed;
//   final int analyzing;

//   const TodaySnapshot({
//     required this.total24h,
//     required this.confirmed,
//     required this.analyzing,
//   });
// }

// class CommunityPulse {
//   final int watchersToday;
//   final int contributorsToday;

//   const CommunityPulse({
//     required this.watchersToday,
//     required this.contributorsToday,
//   });
// }

// /* ====================== HOME ====================== */

// class TestePageHome2 extends StatefulWidget {
//   const TestePageHome2({super.key});

//   @override
//   State<TestePageHome2> createState() => _TestePageHome2State();
// }

// class _TestePageHome2State extends State<TestePageHome2> {
//   // ===== Visual tokens (clean/premium)
//   static const _bg = Color(0xFFF5F7FD);
//   static const _surface = Colors.white;
//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);
//   static const _primary = Color(0xFF2B5BEE);

//   String currentLocation = "Osasco • SP";
//   String lastUpdate = "Atualizado há 5 min";

//   late RegionStatus status = RegionStatus(
//     localityLabel: currentLocation,
//     updateLabel: lastUpdate,
//     periodLabel: "Últimas 24h",
//     level: RiskLevel.low,
//     score: 72,
//     drivers: const [
//       RiskDriver(
//         label: "Roubo de celular",
//         value: "18",
//         positiveUp: true,
//         icon: Icons.smartphone_rounded,
//       ),
//       RiskDriver(
//         label: "Roubo de veículo",
//         value: "9",
//         positiveUp: true,
//         icon: Icons.directions_car_rounded,
//       ),
//       RiskDriver(
//         label: "Furto de moto",
//         value: "6",
//         positiveUp: false,
//         icon: Icons.two_wheeler_rounded,
//       ),
//     ],
//     evidence: const RecentEvidence(
//       kind: EvidenceKind.robbery,
//       title: "Roubo registrado agora",
//       subtitle: "Há 12 min • Centro",
//       verified: true,
//       distanceKm: 1.8,
//       confirmations: 4,
//     ),
//     today: const TodaySnapshot(
//       total24h: 8,
//       confirmed: 3,
//       analyzing: 2,
//     ),
//     pulse: const CommunityPulse(
//       watchersToday: 23,
//       contributorsToday: 7,
//     ),
//   );

//   Color _riskColor(RiskLevel level) => switch (level) {
//         RiskLevel.low => const Color(0xFF059669),
//         RiskLevel.moderate => const Color(0xFFD97706),
//         RiskLevel.high => const Color(0xFFDC2626),
//         RiskLevel.critical => const Color(0xFFB91C1C),
//       };

//   String _riskLabel(RiskLevel level) => switch (level) {
//         RiskLevel.low => "Baixo",
//         RiskLevel.moderate => "Moderado",
//         RiskLevel.high => "Alto",
//         RiskLevel.critical => "Crítico",
//       };

//   String _headlineByLevel(RiskLevel level) => switch (level) {
//         RiskLevel.low =>
//           "Cenário estável. Mantenham atenção em horários de pico.",
//         RiskLevel.moderate =>
//           "Oscilações pontuais. Reforcem cuidados em pontos de maior fluxo.",
//         RiskLevel.high =>
//           "Registros acima do normal. Atenção redobrada em deslocamentos.",
//         RiskLevel.critical =>
//           "Situação crítica. Evitem rotas isoladas e priorizem locais movimentados.",
//       };

//   void _toast(String msg) =>
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

//   void _openHowItWorks() => _toast("Abrir: Como calculamos");
//   void _openLocationPicker() => _toast("Abrir: trocar local");
//   void _openPanicSheet(BuildContext context) => _toast("Abrir: SOS rápido");

//   @override
//   Widget build(BuildContext context) {
//     final hasEvidence = status.evidence != null;

//     // card flutuante (altura + topo)
//     const floatingH = 92.0;
//     const floatingTop = 12.0;

//     return Scaffold(
//       backgroundColor: _bg,
//       appBar: AppBar(
//         elevation: 1,
//         backgroundColor: _surface,
//         surfaceTintColor: _surface,
//         titleSpacing: 16,
//         title: const Text(
//           "Osasco",
//           style: TextStyle(
//             color: _ink,
//             fontWeight: FontWeight.w900,
//             fontSize: 16,
//           ),
//         ),
//         actions: [
//           IconButton(
//             tooltip: "Trocar local",
//             onPressed: _openLocationPicker,
//             icon: const Icon(Icons.place_outlined, color: _ink),
//           ),
//           IconButton(
//             tooltip: "Como calculamos",
//             onPressed: _openHowItWorks,
//             icon: const Icon(Icons.info_outline, color: _ink),
//           ),
//           const SizedBox(width: 6),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () => _openPanicSheet(context),
//         icon: const Icon(Icons.sos_rounded),
//         label: const Text("SOS", style: TextStyle(fontWeight: FontWeight.w900)),
//         backgroundColor: const Color(0xFFEF4444),
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           ListView(
//             padding: EdgeInsets.fromLTRB(
//               16,
//               16 + (hasEvidence ? (floatingH + floatingTop + 10) : 0),
//               16,
//               24,
//             ),
//             children: [
//               LocationCard(
//                 location: currentLocation,
//                 updateLabel: lastUpdate,
//                 onChange: _openLocationPicker,
//               ),
//               const SizedBox(height: 14),

//               // 1) Índice coletivo (clean)
//               RegionSummaryHeroCollective(
//                 locality: status.localityLabel,
//                 periodLabel: status.periodLabel,
//                 level: status.level,
//                 score: status.score, // 72
//                 headline: _headlineByLevel(status.level),
//                 onPrimaryAction: () => _toast("Abrir mapa / rotas seguras"),
//               ),

//               const SizedBox(height: 12),

//               // 2) Panorama de hoje (coletivo)
//               TodayPanoramaCard(
//                 title: "Panorama de hoje",
//                 subtitle: "Resumo coletivo nas últimas 24h",
//                 total24h: status.today.total24h,
//                 confirmed: status.today.confirmed,
//                 analyzing: status.today.analyzing,
//               ),

//               const SizedBox(height: 12),

//               // 3) Principais ocorrências (top 3 horizontal)
//               DriversTopHorizontalCard(
//                 title: "Principais ocorrências na região",
//                 subtitle: "Top 3 do período",
//                 drivers: status.drivers,
//                 onTapDriver: (d) => _toast("Abrir lista filtrada: ${d.label}"),
//               ),

//               const SizedBox(height: 12),

//               // 4) Movimento da comunidade
//               //Atividade da comunidade
//               CommunityMovementCard(
//                 title: "Movimento da comunidade",
//                 subtitle: "Acompanhamento e contribuições de hoje",
//                 watchersToday: status.pulse.watchersToday,
//                 contributorsToday: status.pulse.contributorsToday,
//                 onSeeMore: () => _toast("Abrir detalhes da comunidade"),
//               ),

//               const SizedBox(height: 12),

//               // 5) CTA principal (coletivo)
//               ContributePrimaryCard(
//                 onContribute: () => _toast("Abrir: contribuir com alerta"),
//               ),
//             ],
//           ),

//           // Ocorrência recente flutuante no topo
//           if (hasEvidence)
//             Positioned(
//               left: 16,
//               right: 16,
//               top: floatingTop,
//               child: RecentIncidentFloatingCard(
//                 evidence: status.evidence!,
//                 onTap: () => _toast("Abrir incidente mais recente"),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// /* ====================== COMPONENTS ====================== */

// class LocationCard extends StatelessWidget {
//   final String location;
//   final String updateLabel;
//   final VoidCallback onChange;

//   const LocationCard({
//     super.key,
//     required this.location,
//     required this.updateLabel,
//     required this.onChange,
//   });

//   static const _surface = Colors.white;
//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _primary = Color(0xFF2B5BEE);
//   static const _border = Color(0xFFE6EAF6);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: _surface,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: _border),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x122B5BEE),
//             blurRadius: 18,
//             offset: Offset(0, 10),
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
//             SizedBox(
//               width: 108,
//               height: 44,
//               child: OutlinedButton.icon(
//                 onPressed: onChange,
//                 icon: const Icon(Icons.swap_horiz_rounded, size: 18),
//                 label: const Text(
//                   "Trocar",
//                   style: TextStyle(fontWeight: FontWeight.w900),
//                 ),
//                 style: OutlinedButton.styleFrom(
//                   foregroundColor: _ink,
//                   side: const BorderSide(color: _border),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RegionSummaryHeroCollective extends StatelessWidget {
//   final String locality;
//   final String periodLabel;
//   final RiskLevel level;
//   final int score; // 0..100
//   final String headline;
//   final VoidCallback onPrimaryAction;

//   const RegionSummaryHeroCollective({
//     super.key,
//     required this.locality,
//     required this.periodLabel,
//     required this.level,
//     required this.score,
//     required this.headline,
//     required this.onPrimaryAction,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);
//   static const _primary = Color(0xFF2B5BEE);

//   Color _levelColor() => switch (level) {
//         RiskLevel.low => const Color(0xFF059669),
//         RiskLevel.moderate => const Color(0xFFD97706),
//         RiskLevel.high => const Color(0xFFDC2626),
//         RiskLevel.critical => const Color(0xFFB91C1C),
//       };

//   String _levelLabel() => switch (level) {
//         RiskLevel.low => "Baixo",
//         RiskLevel.moderate => "Moderado",
//         RiskLevel.high => "Alto",
//         RiskLevel.critical => "Crítico",
//       };

//   String _primaryLabel() => switch (level) {
//         RiskLevel.critical => "Ver rotas seguras",
//         RiskLevel.high => "Ver rotas seguras",
//         _ => "Ver mapa",
//       };

//   IconData _primaryIcon() => switch (level) {
//         RiskLevel.critical => Icons.route_rounded,
//         RiskLevel.high => Icons.route_rounded,
//         _ => Icons.map_outlined,
//       };

//   @override
//   Widget build(BuildContext context) {
//     final c = _levelColor();
//     final s = score.clamp(0, 100);
//     final progress = s / 100.0;

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: _border),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x122B5BEE),
//             blurRadius: 18,
//             offset: Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // topo (coletivo)
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     "$locality • $periodLabel",
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: _muted,
//                       fontWeight: FontWeight.w800,
//                       fontSize: 13.2,
//                     ),
//                   ),
//                 ),
//                 _Pill(text: _levelLabel(), color: c),
//               ],
//             ),
//             const SizedBox(height: 12),

//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // bloco índice (72/100)
//                 Container(
//                   width: 140,
//                   padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: _border),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Índice coletivo",
//                         style: TextStyle(
//                           color: _muted,
//                           fontWeight: FontWeight.w900,
//                           fontSize: 12.5,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "$s",
//                               style: const TextStyle(
//                                 color: _ink,
//                                 fontWeight: FontWeight.w900,
//                                 fontSize: 44,
//                                 height: 1,
//                                 letterSpacing: -0.6,
//                               ),
//                             ),
//                             const TextSpan(
//                               text: "/100",
//                               style: TextStyle(
//                                 color: _muted,
//                                 fontWeight: FontWeight.w900,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(999),
//                         child: Container(
//                           height: 10,
//                           color: const Color(0xFFF5F7FD),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: FractionallySizedBox(
//                               widthFactor: progress,
//                               child: Container(color: c),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         "Nível: ${_levelLabel()}",
//                         style: const TextStyle(
//                           color: _muted,
//                           fontWeight: FontWeight.w800,
//                           fontSize: 12.8,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(width: 12),

//                 // headline (sem tendências/sem “baseado em registros”)
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF8FAFF),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: _border),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 4,
//                           height: 56,
//                           decoration: BoxDecoration(
//                             color: c,
//                             borderRadius: BorderRadius.circular(999),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: Text(
//                             headline,
//                             style: const TextStyle(
//                               color: _ink,
//                               fontWeight: FontWeight.w900,
//                               fontSize: 16,
//                               height: 1.2,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 14),

//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: onPrimaryAction,
//                 icon: Icon(_primaryIcon()),
//                 label: Text(
//                   _primaryLabel(),
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 15,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: _primary,
//                   foregroundColor: Colors.white,
//                   elevation: 0,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TodayPanoramaCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final int total24h;
//   final int confirmed;
//   final int analyzing;

//   const TodayPanoramaCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.total24h,
//     required this.confirmed,
//     required this.analyzing,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);

//   @override
//   Widget build(BuildContext context) {
//     return _BaseCard(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: _ink,
//                 fontWeight: FontWeight.w900,
//                 fontSize: 16.5,
//               ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 color: _muted,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 13.2,
//               ),
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: [
//                 Expanded(
//                   child: _KpiTile(
//                     label: "Registros",
//                     value: "$total24h",
//                     icon: Icons.receipt_long_rounded,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: _KpiTile(
//                     label: "Confirmados",
//                     value: "$confirmed",
//                     icon: Icons.verified_rounded,
//                     valueColor: const Color(0xFF059669),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: _KpiTile(
//                     label: "Em análise",
//                     value: "$analyzing",
//                     icon: Icons.hourglass_top_rounded,
//                     valueColor: const Color(0xFF64748B),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 6),
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF8FAFF),
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(color: _border),
//               ),
//               child: const Text(
//                 "Acompanhe e contribua para fortalecer o monitoramento coletivo da região.",
//                 style: TextStyle(
//                   color: _muted,
//                   fontWeight: FontWeight.w700,
//                   height: 1.25,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DriversTopHorizontalCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final List<RiskDriver> drivers;
//   final ValueChanged<RiskDriver>? onTapDriver;

//   const DriversTopHorizontalCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.drivers,
//     this.onTapDriver,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);

//   @override
//   Widget build(BuildContext context) {
//     final top3 = drivers.take(3).toList();

//     return _BaseCard(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: _ink,
//                 fontWeight: FontWeight.w900,
//                 fontSize: 16.5,
//               ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 color: _muted,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 13.2,
//               ),
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: top3
//                   .map(
//                     (d) => Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                         child: _DriverMiniCard(
//                           driver: d,
//                           onTap: onTapDriver == null
//                               ? null
//                               : () => onTapDriver!(d),
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _DriverMiniCard extends StatelessWidget {
//   final RiskDriver driver;
//   final VoidCallback? onTap;

//   const _DriverMiniCard({
//     required this.driver,
//     this.onTap,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);

//   Color get _valueColor =>
//       driver.positiveUp ? const Color(0xFFDC2626) : const Color(0xFF059669);

//   @override
//   Widget build(BuildContext context) {
//     final vc = _valueColor;

//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(18),
//       child: Container(
//         padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(18),
//           border: Border.all(color: _border),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ícone
//             Container(
//               width: 36,
//               height: 36,
//               decoration: BoxDecoration(
//                 color: vc.withOpacity(0.08),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(driver.icon, color: vc, size: 18),
//             ),
//             const SizedBox(height: 12),

//             // label
//             Text(
//               driver.label,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 color: _ink,
//                 fontWeight: FontWeight.w800,
//                 fontSize: 13.5,
//                 height: 1.2,
//               ),
//             ),
//             const SizedBox(height: 10),

//             // valor (ex: "18")
//             Row(
//               children: [
//                 Container(
//                   width: 8,
//                   height: 8,
//                   decoration: BoxDecoration(color: vc, shape: BoxShape.circle),
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   driver.value,
//                   style: TextStyle(
//                     color: vc,
//                     fontWeight: FontWeight.w900,
//                     fontSize: 16,
//                     height: 1,
//                   ),
//                 ),
//                 const SizedBox(width: 6),
//                 const Text(
//                   "registros",
//                   style: TextStyle(
//                     color: _muted,
//                     fontWeight: FontWeight.w800,
//                     fontSize: 12.5,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CommunityMovementCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final int watchersToday;
//   final int contributorsToday;
//   final VoidCallback onSeeMore;

//   const CommunityMovementCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.watchersToday,
//     required this.contributorsToday,
//     required this.onSeeMore,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _primary = Color(0xFF2B5BEE);

//   @override
//   Widget build(BuildContext context) {
//     return _BaseCard(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: _ink,
//                 fontWeight: FontWeight.w900,
//                 fontSize: 16.5,
//               ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 color: _muted,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 13.2,
//               ),
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: [
//                 Expanded(
//                   child: _KpiTile(
//                     label: "Acompanhando",
//                     value: "$watchersToday",
//                     icon: Icons.visibility_rounded,
//                     valueColor: _primary,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: _KpiTile(
//                     label: "Contribuíram",
//                     value: "$contributorsToday",
//                     icon: Icons.volunteer_activism_rounded,
//                     valueColor: const Color(0xFF059669),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: TextButton(
//                 onPressed: onSeeMore,
//                 child: const Text(
//                   "Ver detalhes",
//                   style: TextStyle(fontWeight: FontWeight.w900),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ContributePrimaryCard extends StatelessWidget {
//   final VoidCallback onContribute;

//   const ContributePrimaryCard({
//     super.key,
//     required this.onContribute,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _primary = Color(0xFF2B5BEE);
//   static const _border = Color(0xFFE6EAF6);

//   @override
//   Widget build(BuildContext context) {
//     return _BaseCard(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Contribua com a segurança da região",
//               style: TextStyle(
//                 color: _ink,
//                 fontWeight: FontWeight.w900,
//                 fontSize: 16.5,
//               ),
//             ),
//             const SizedBox(height: 6),
//             const Text(
//               "Registre um alerta para ajudar outras pessoas a se prevenirem.",
//               style: TextStyle(
//                 color: _muted,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 13.2,
//                 height: 1.2,
//               ),
//             ),
//             const SizedBox(height: 14),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: onContribute,
//                 icon: const Icon(Icons.add_alert_rounded),
//                 label: const Text(
//                   "Contribuir com alerta",
//                   style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: _primary,
//                   foregroundColor: Colors.white,
//                   elevation: 0,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF8FAFF),
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(color: _border),
//               ),
//               child: const Text(
//                 "Quanto mais contribuições e confirmações, mais forte fica o monitoramento coletivo.",
//                 style: TextStyle(
//                   color: _muted,
//                   fontWeight: FontWeight.w700,
//                   height: 1.25,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* ====================== FLOATING INCIDENT ====================== */

// class RecentIncidentFloatingCard extends StatelessWidget {
//   final RecentEvidence evidence;
//   final VoidCallback onTap;

//   const RecentIncidentFloatingCard({
//     super.key,
//     required this.evidence,
//     required this.onTap,
//   });

//   static const _surface = Colors.white;
//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);

//   Color get _accent => switch (evidence.kind) {
//         EvidenceKind.robbery => const Color(0xFFDC2626),
//         EvidenceKind.theft => const Color(0xFFD97706),
//         EvidenceKind.recovered => const Color(0xFF059669),
//       };

//   IconData get _icon => switch (evidence.kind) {
//         EvidenceKind.robbery => Icons.report_gmailerrorred_rounded,
//         EvidenceKind.theft => Icons.warning_amber_rounded,
//         EvidenceKind.recovered => Icons.verified_rounded,
//       };

//   String get _distanceText {
//     final km = evidence.distanceKm;
//     if (km < 1) {
//       final m = (km * 1000).round();
//       return "$m m";
//     }
//     return "${km.toStringAsFixed(1).replaceAll('.', ',')} km";
//   }

//   @override
//   Widget build(BuildContext context) {
//     final a = _accent;

//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(18),
//         child: Ink(
//           decoration: BoxDecoration(
//             color: _surface,
//             borderRadius: BorderRadius.circular(18),
//             border: Border.all(color: _border),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0x122B5BEE),
//                 blurRadius: 18,
//                 offset: Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
//             child: Row(
//               children: [
//                 // barra
//                 Container(
//                   width: 4,
//                   height: 46,
//                   decoration: BoxDecoration(
//                     color: a,
//                     borderRadius: BorderRadius.circular(999),
//                   ),
//                 ),
//                 const SizedBox(width: 12),

//                 // ícone
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: a.withOpacity(0.10),
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   child: Icon(_icon, color: a, size: 20),
//                 ),
//                 const SizedBox(width: 12),

//                 // texto
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               evidence.title,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 color: _ink,
//                                 fontWeight: FontWeight.w900,
//                                 fontSize: 14.5,
//                                 height: 1.1,
//                               ),
//                             ),
//                           ),
//                           if (evidence.verified) ...[
//                             const SizedBox(width: 8),
//                             const Icon(Icons.verified_rounded,
//                                 size: 16, color: Color(0xFF059669)),
//                           ],
//                         ],
//                       ),
//                       const SizedBox(height: 6),
//                       Text(
//                         "${evidence.subtitle} • $_distanceText • ${evidence.confirmations} confirmações",
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           color: _muted,
//                           fontWeight: FontWeight.w800,
//                           fontSize: 13.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Icon(Icons.chevron_right_rounded,
//                     color: a.withOpacity(0.9), size: 28),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /* ====================== UI HELPERS ====================== */

// class _BaseCard extends StatelessWidget {
//   final Widget child;
//   const _BaseCard({required this.child});

//   static const _border = Color(0xFFE6EAF6);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: _border),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x122B5BEE),
//             blurRadius: 18,
//             offset: Offset(0, 10),
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
// }

// class _Pill extends StatelessWidget {
//   final String text;
//   final Color color;

//   const _Pill({required this.text, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.10),
//         borderRadius: BorderRadius.circular(999),
//         border: Border.all(color: color.withOpacity(0.18)),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontWeight: FontWeight.w900,
//           color: color,
//           fontSize: 12,
//         ),
//       ),
//     );
//   }
// }

// class _KpiTile extends StatelessWidget {
//   final String label;
//   final String value;
//   final IconData icon;
//   final Color? valueColor;

//   const _KpiTile({
//     required this.label,
//     required this.value,
//     required this.icon,
//     this.valueColor,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);

//   @override
//   Widget build(BuildContext context) {
//     final vc = valueColor ?? _ink;

//     return Container(
//       padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF8FAFF),
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: _border),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 34,
//             height: 34,
//             decoration: BoxDecoration(
//               color: vc.withOpacity(0.10),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(icon, color: vc, size: 18),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     color: _muted,
//                     fontWeight: FontWeight.w800,
//                     fontSize: 12.2,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   value,
//                   style: TextStyle(
//                     color: vc,
//                     fontWeight: FontWeight.w900,
//                     fontSize: 16,
//                     height: 1,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
