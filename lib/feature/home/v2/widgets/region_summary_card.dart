// import 'package:deehelp/feature/home/v2/models.dart';
// import 'package:deehelp/feature/home/v2/widgets/pill.dart';
// import 'package:flutter/material.dart';

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
//                 Pill(text: _levelLabel(), color: c),
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
