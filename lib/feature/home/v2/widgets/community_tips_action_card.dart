// import 'package:deehelp/core/extension/color_extension.dart';
// import 'package:deehelp/feature/home/v2/widgets/pill_tone.dart';
// import 'package:deehelp/feature/home/v2/widgets/tip_row.dart';
// import 'package:flutter/material.dart';

// class CommunityTip {
//   final IconData icon;
//   final String title;
//   final String subtitle;

//   const CommunityTip({
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//   });
// }

// class CommunityTipsAndActionsCard extends StatelessWidget {
//   final List<CommunityTip> tips;
//   final VoidCallback onSendTip;
//   final VoidCallback onShareRoute;

//   const CommunityTipsAndActionsCard({
//     super.key,
//     required this.tips,
//     required this.onSendTip,
//     required this.onShareRoute,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const ink = Color(0xFF1F2A37);
//     const muted = Color(0xFF6B7280);
//     const success = Color(0xFF22C55E);

//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         // color: success.withOpacity(0.09),
//         color: context.primaryColor.withOpacity(0.01),
//         border: Border.all(color: context.primaryColor.withOpacity(0.18)),
//         boxShadow: const [
//           // BoxShadow(
//           //   color: Color(0x122B5BEE),
//           //   blurRadius: 18,
//           //   offset: Offset(0, 10),
//           // ),
//           BoxShadow(
//             color: Color(0x1F2B5BEE),
//             blurRadius: 28,
//             spreadRadius: 1,
//             offset: Offset(0, 14),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 10,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child:
//                       Icon(Icons.people, size: 18, color: context.primaryColor),
//                 ),
//                 const SizedBox(width: 10),
//                 const Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Dicas & ações",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w900,
//                           color: ink,
//                         ),
//                       ),
//                       SizedBox(height: 2),
//                       Text(
//                         "Sugestões rápidas para reduzir risco hoje",
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: muted,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 PillTone(
//                   text: "Anônimo",
//                   icon: Icons.privacy_tip,
//                   tone: Tone.success,
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             // Tips list
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.04),
//                     blurRadius: 12,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   for (int i = 0; i < tips.length; i++) ...[
//                     TipRow(tip: tips[i]),
//                     if (i != tips.length - 1)
//                       const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: Divider(height: 1),
//                       ),
//                   ],
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             // Actions
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton.icon(
//                     onPressed: onSendTip,
//                     icon: const Icon(Icons.edit, size: 18),
//                     label: const Text("Alertar comunidade"),
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: ink,
//                       side: BorderSide(
//                           color: context.primaryColor.withOpacity(0.35)),
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                       textStyle: const TextStyle(fontWeight: FontWeight.w800),
//                       backgroundColor: Colors.white.withOpacity(0.6),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: ElevatedButton.icon(
//                     onPressed: onShareRoute,
//                     icon: const Icon(Icons.route, size: 18),
//                     label: const Text("Ver mais"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: context.primaryColor,
//                       foregroundColor: Colors.white,
//                       elevation: 0,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                       textStyle: const TextStyle(fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             // Footnote
//             Text(
//               "Dica: registre ocorrências em 10s para alertar vizinhos próximos.",
//               style: TextStyle(
//                 fontSize: 11,
//                 color: muted.withOpacity(0.95),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CommunityTipsCardPro extends StatelessWidget {
//   final List<CommunityTip> tips;
//   final VoidCallback onSendTip;

//   const CommunityTipsCardPro({
//     super.key,
//     required this.tips,
//     required this.onSendTip,
//   });

//   static const _ink = Color(0xFF1F2A37);
//   static const _muted = Color(0xFF6B7280);
//   static const _border = Color(0xFFE6EAF6);
//   static const _soft = Color(0xFFF8FAFF);

//   @override
//   Widget build(BuildContext context) {
//     final primary = context.primaryColor;

//     return Container(
//       decoration: BoxDecoration(
//         color: _soft,
//         borderRadius: BorderRadius.circular(22),
//         border: Border.all(color: _border),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x14000000),
//             blurRadius: 18,
//             offset: Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header (mais clean)
//             Row(
//               children: [
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(14),
//                     border: Border.all(color: _border),
//                   ),
//                   child: Icon(
//                     Icons.lightbulb_rounded,
//                     size: 20,
//                     color: primary,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 const Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Dicas da comunidade",
//                         style: TextStyle(
//                           fontSize: 15.5,
//                           fontWeight: FontWeight.w900,
//                           color: _ink,
//                           height: 1.05,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Text(
//                         "Sugestões rápidas para reduzir risco hoje",
//                         style: TextStyle(
//                           fontSize: 12.6,
//                           color: _muted,
//                           fontWeight: FontWeight.w700,
//                           height: 1.15,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 PillTone(
//                   text: "Anônimo",
//                   icon: Icons.privacy_tip_rounded,
//                   tone: Tone.success,
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),
//             Container(height: 1, color: _border),
//             const SizedBox(height: 12),

//             // Lista (sem sombra, só superfície + borda)
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(color: _border),
//               ),
//               child: Column(
//                 children: [
//                   for (int i = 0; i < tips.length; i++) ...[
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 10),
//                       child: TipRow(tip: tips[i]),
//                     ),
//                     if (i != tips.length - 1)
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 12),
//                         child: Divider(height: 1),
//                       ),
//                   ],
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             // CTA único (pro)
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: onSendTip,
//                 icon: const Icon(Icons.edit_rounded, size: 18),
//                 label: const Text("Alertar comunidade"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primary,
//                   foregroundColor: Colors.white,
//                   elevation: 0,
//                   padding: const EdgeInsets.symmetric(vertical: 13),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   textStyle: const TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 13.5,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             // Footnote (bem discreto)
//             Text(
//               "Dica: registre ocorrências em 10s para alertar vizinhos próximos.",
//               style: TextStyle(
//                 fontSize: 11.5,
//                 color: _muted.withOpacity(0.95),
//                 fontWeight: FontWeight.w600,
//                 height: 1.2,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
