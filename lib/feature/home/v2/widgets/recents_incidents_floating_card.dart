// import 'package:flutter/material.dart';

// import '../models.dart';

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
//     final accent = _accent;

//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(20),
//         onTap: onTap,
//         child: Ink(
//           decoration: BoxDecoration(
//             color: _surface,
//             borderRadius: BorderRadius.circular(20),

//             // 🔵 borda destacada
//             border: Border.all(
//               color: accent.withOpacity(0.35),
//               width: 1.2,
//             ),

//             // ✨ glow
//             boxShadow: [
//               BoxShadow(
//                 color: accent.withOpacity(0.15),
//                 blurRadius: 24,
//                 spreadRadius: 1,
//                 offset: const Offset(0, 8),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
//             child: Row(
//               children: [
//                 // barra lateral mais forte
//                 Container(
//                   width: 5,
//                   height: 52,
//                   decoration: BoxDecoration(
//                     color: accent,
//                     borderRadius: BorderRadius.circular(999),
//                   ),
//                 ),

//                 const SizedBox(width: 12),

//                 // icone
//                 Container(
//                   width: 42,
//                   height: 42,
//                   decoration: BoxDecoration(
//                     color: accent.withOpacity(.12),
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   child: Icon(_icon, color: accent, size: 22),
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
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),

//                           // badge RECENTE
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8, vertical: 3),
//                             decoration: BoxDecoration(
//                               color: accent.withOpacity(.12),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Text(
//                               "AGORA",
//                               style: TextStyle(
//                                 color: accent,
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.w900,
//                               ),
//                             ),
//                           ),

//                           if (evidence.verified) ...[
//                             const SizedBox(width: 6),
//                             const Icon(
//                               Icons.verified_rounded,
//                               size: 16,
//                               color: Color(0xFF059669),
//                             ),
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
//                           fontWeight: FontWeight.w700,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(width: 8),

//                 Icon(
//                   Icons.chevron_right_rounded,
//                   color: accent,
//                   size: 28,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class RecentIncidentFloatingCard extends StatelessWidget {
// //   final RecentEvidence evidence;
// //   final VoidCallback onTap;

// //   const RecentIncidentFloatingCard({
// //     super.key,
// //     required this.evidence,
// //     required this.onTap,
// //   });

// //   static const _surface = Colors.white;
// //   static const _ink = Color(0xFF1F2A44);
// //   static const _muted = Color(0xFF8A96C8);
// //   static const _border = Color(0xFFE6EAF6);

// //   Color get _accent => switch (evidence.kind) {
// //         EvidenceKind.robbery => const Color(0xFFDC2626),
// //         EvidenceKind.theft => const Color(0xFFD97706),
// //         EvidenceKind.recovered => const Color(0xFF059669),
// //       };

// //   IconData get _icon => switch (evidence.kind) {
// //         EvidenceKind.robbery => Icons.report_gmailerrorred_rounded,
// //         EvidenceKind.theft => Icons.warning_amber_rounded,
// //         EvidenceKind.recovered => Icons.verified_rounded,
// //       };

// //   String get _distanceText {
// //     final km = evidence.distanceKm;
// //     if (km < 1) {
// //       final m = (km * 1000).round();
// //       return "$m m";
// //     }
// //     return "${km.toStringAsFixed(1).replaceAll('.', ',')} km";
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final a = _accent;

// //     return Material(
// //       color: Colors.transparent,
// //       child: InkWell(
// //         onTap: onTap,
// //         borderRadius: BorderRadius.circular(18),
// //         child: Ink(
// //           decoration: BoxDecoration(
// //             color: _surface,
// //             borderRadius: BorderRadius.circular(18),
// //             border: Border.all(color: _border),
// //             boxShadow: const [
// //               BoxShadow(
// //                 color: Color(0x122B5BEE),
// //                 blurRadius: 18,
// //                 offset: Offset(0, 10),
// //               ),
// //             ],
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
// //             child: Row(
// //               children: [
// //                 // barra
// //                 Container(
// //                   width: 4,
// //                   height: 46,
// //                   decoration: BoxDecoration(
// //                     color: a,
// //                     borderRadius: BorderRadius.circular(999),
// //                   ),
// //                 ),
// //                 const SizedBox(width: 12),

// //                 // ícone
// //                 Container(
// //                   width: 40,
// //                   height: 40,
// //                   decoration: BoxDecoration(
// //                     color: a.withOpacity(0.10),
// //                     borderRadius: BorderRadius.circular(14),
// //                   ),
// //                   child: Icon(_icon, color: a, size: 20),
// //                 ),
// //                 const SizedBox(width: 12),

// //                 // texto
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Row(
// //                         children: [
// //                           Expanded(
// //                             child: Text(
// //                               evidence.title,
// //                               maxLines: 1,
// //                               overflow: TextOverflow.ellipsis,
// //                               style: const TextStyle(
// //                                 color: _ink,
// //                                 fontWeight: FontWeight.w900,
// //                                 fontSize: 14.5,
// //                                 height: 1.1,
// //                               ),
// //                             ),
// //                           ),
// //                           if (evidence.verified) ...[
// //                             const SizedBox(width: 8),
// //                             const Icon(Icons.verified_rounded,
// //                                 size: 16, color: Color(0xFF059669)),
// //                           ],
// //                         ],
// //                       ),
// //                       const SizedBox(height: 6),
// //                       Text(
// //                         "${evidence.subtitle} • $_distanceText • ${evidence.confirmations} confirmações",
// //                         maxLines: 1,
// //                         overflow: TextOverflow.ellipsis,
// //                         style: const TextStyle(
// //                           color: _muted,
// //                           fontWeight: FontWeight.w800,
// //                           fontSize: 13.0,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 const SizedBox(width: 8),
// //                 Icon(Icons.chevron_right_rounded,
// //                     color: a.withOpacity(0.9), size: 28),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
