// import 'package:deehelp/feature/home/v2/widgets/kpi_title.dart';
// import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
// import 'package:flutter/material.dart';

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
//     return PageCard(
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
//                   child: KpiTile(
//                     label: "Acompanhando",
//                     value: "$watchersToday",
//                     icon: Icons.visibility_rounded,
//                     valueColor: _primary,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: KpiTile(
//                     label: "Contribuíram",
//                     value: "$contributorsToday",
//                     icon: Icons.volunteer_activism_rounded,
//                     valueColor: const Color(0xFF059669),
//                   ),
//                 ),
//               ],
//             ),
//             // const SizedBox(height: 8),
//             // Align(
//             //   alignment: Alignment.centerLeft,
//             //   child: TextButton(
//             //     onPressed: onSeeMore,
//             //     child: const Text(
//             //       "Ver detalhes",
//             //       style: TextStyle(fontWeight: FontWeight.w900),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CommunityMovementCardPro extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final int watchersToday;
//   final int contributorsToday;

//   /// opcional (deixa mais “pro” no carrossel, mas pode remover)
//   final VoidCallback? onSeeMore;

//   const CommunityMovementCardPro({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.watchersToday,
//     required this.contributorsToday,
//     this.onSeeMore,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);
//   static const _soft = Color(0xFFF8FAFF);

//   static const _primary = Color(0xFF2B5BEE);
//   static const _positive = Color(0xFF059669);

//   @override
//   Widget build(BuildContext context) {
//     return PageCard(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     title,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: _ink,
//                       fontWeight: FontWeight.w900,
//                       fontSize: 16.5,
//                       height: 1.05,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 _Badge(text: "HOJE"),
//                 if (onSeeMore != null) ...[
//                   const SizedBox(width: 6),
//                   TextButton(
//                     onPressed: onSeeMore,
//                     style: TextButton.styleFrom(
//                       foregroundColor: _primary,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 6),
//                       textStyle: const TextStyle(fontWeight: FontWeight.w900),
//                     ),
//                     child: const Text("Ver"),
//                   ),
//                 ],
//               ],
//             ),
//             const SizedBox(height: 6),

//             Text(
//               subtitle,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 color: _muted,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 13.2,
//               ),
//             ),

//             const SizedBox(height: 12),
//             Container(height: 1, color: _border),
//             const SizedBox(height: 12),

//             // KPIs em faixa única (premium)
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(color: _border),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _KpiMini(
//                       label: "Acompanhando",
//                       value: "$watchersToday",
//                       icon: Icons.visibility_rounded,
//                       tint: _primary,
//                       valueColor: _primary,
//                     ),
//                   ),
//                   Container(
//                     width: 1,
//                     height: 44,
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     color: _border,
//                   ),
//                   Expanded(
//                     child: _KpiMini(
//                       label: "Contribuíram",
//                       value: "$contributorsToday",
//                       icon: Icons.volunteer_activism_rounded,
//                       tint: _positive,
//                       valueColor: _positive,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             // Callout discreto (opcional: pode remover se quiser ultra clean)
//             Container(
//               decoration: BoxDecoration(
//                 color: _soft,
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: _border),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//               child: const Row(
//                 children: [
//                   Icon(Icons.people_alt_rounded, size: 18, color: _muted),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       "Mais gente acompanhando e contribuindo melhora a precisão do monitoramento.",
//                       style: TextStyle(
//                         color: _muted,
//                         fontWeight: FontWeight.w700,
//                         fontSize: 12.8,
//                         height: 1.25,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CommunityMovementCardInsight extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final int watchersToday;
//   final int contributorsToday;

//   const CommunityMovementCardInsight({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.watchersToday,
//     required this.contributorsToday,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);
//   static const _soft = Color(0xFFF8FAFF);

//   static const _primary = Color(0xFF2B5BEE);
//   static const _positive = Color(0xFF059669);

//   @override
//   Widget build(BuildContext context) {
//     final total = watchersToday + contributorsToday;

//     return PageCard(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// Header
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

//             /// Número principal (engajamento total)
//             Center(
//               child: Column(
//                 children: [
//                   Text(
//                     "$total",
//                     style: const TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.w900,
//                       color: _ink,
//                       height: 1,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     "pessoas engajadas hoje",
//                     style: TextStyle(
//                       color: _muted,
//                       fontWeight: FontWeight.w800,
//                       fontSize: 13,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 18),

//             /// Linha de estatísticas
//             Row(
//               children: [
//                 Expanded(
//                   child: _MiniStat(
//                     icon: Icons.visibility_rounded,
//                     label: "Acompanhando",
//                     value: watchersToday,
//                     color: _primary,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: _MiniStat(
//                     icon: Icons.volunteer_activism_rounded,
//                     label: "Contribuíram",
//                     value: contributorsToday,
//                     color: _positive,
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

// class CommunityMovementCardProClean extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final int watchersToday;
//   final int contributorsToday;

//   const CommunityMovementCardProClean({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.watchersToday,
//     required this.contributorsToday,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);
//   static const _soft = Color(0xFFF8FAFF);

//   static const _primary = Color(0xFF2B5BEE);
//   static const _positive = Color(0xFF059669);

//   @override
//   Widget build(BuildContext context) {
//     return PageCard(
//       // bgColor: AppColors.success.withValues(alpha: 0.1),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     title,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: _ink,
//                       fontWeight: FontWeight.w900,
//                       fontSize: 16.5,
//                       height: 1.05,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 _Badge(text: "HOJE"),
//               ],
//             ),
//             const SizedBox(height: 6),
//             Text(
//               subtitle,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 color: _muted,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 13.2,
//               ),
//             ),

//             const SizedBox(height: 12),
//             Container(height: 1, color: _border),
//             const SizedBox(height: 12),

//             // Metrics row (super clean)
//             Container(
//               decoration: BoxDecoration(
//                 color: _soft,
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(color: _border),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _Metric(
//                       label: "Acompanhando",
//                       value: "$watchersToday",
//                       icon: Icons.visibility_rounded,
//                       tint: _primary,
//                     ),
//                   ),
//                   Container(
//                     width: 1,
//                     height: 42,
//                     margin: const EdgeInsets.symmetric(horizontal: 12),
//                     color: _border,
//                   ),
//                   Expanded(
//                     child: _Metric(
//                       label: "Contribuíram",
//                       value: "$contributorsToday",
//                       icon: Icons.volunteer_activism_rounded,
//                       tint: _positive,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _Badge2 extends StatelessWidget {
//   final String text;
//   const _Badge2({required this.text});

//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF8FAFF),
//         borderRadius: BorderRadius.circular(999),
//         border: Border.all(color: _border),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: _muted,
//           fontWeight: FontWeight.w900,
//           fontSize: 12.0,
//           letterSpacing: 0.35,
//         ),
//       ),
//     );
//   }
// }

// class _Metric extends StatelessWidget {
//   final String label;
//   final String value;
//   final IconData icon;
//   final Color tint;

//   const _Metric({
//     required this.label,
//     required this.value,
//     required this.icon,
//     required this.tint,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 36,
//           height: 36,
//           decoration: BoxDecoration(
//             color: tint.withOpacity(0.12),
//             borderRadius: BorderRadius.circular(14),
//           ),
//           child: Icon(icon, color: tint, size: 19),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 value,
//                 style: const TextStyle(
//                   color: _ink,
//                   fontWeight: FontWeight.w900,
//                   fontSize: 18,
//                   height: 1.0,
//                 ),
//               ),
//               const SizedBox(height: 3),
//               Text(
//                 label,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   color: _muted,
//                   fontWeight: FontWeight.w800,
//                   fontSize: 12.2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _MiniStat extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final int value;
//   final Color color;

//   const _MiniStat({
//     required this.icon,
//     required this.label,
//     required this.value,
//     required this.color,
//   });

//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);
//   static const _soft = Color(0xFFF8FAFF);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 12,
//       ),
//       decoration: BoxDecoration(
//         color: _soft,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: _border),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 34,
//             height: 34,
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.12),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(icon, color: color, size: 18),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "$value",
//                   style: TextStyle(
//                     color: color,
//                     fontWeight: FontWeight.w900,
//                     fontSize: 16,
//                     height: 1,
//                   ),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     color: _muted,
//                     fontWeight: FontWeight.w800,
//                     fontSize: 12,
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

// class _Badge extends StatelessWidget {
//   final String text;
//   const _Badge({required this.text});

//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF8FAFF),
//         borderRadius: BorderRadius.circular(999),
//         border: Border.all(color: _border),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: _muted,
//           fontWeight: FontWeight.w900,
//           fontSize: 12.0,
//           letterSpacing: 0.4,
//         ),
//       ),
//     );
//   }
// }

// class _KpiMini extends StatelessWidget {
//   final String label;
//   final String value;
//   final IconData icon;
//   final Color tint;
//   final Color valueColor;

//   const _KpiMini({
//     required this.label,
//     required this.value,
//     required this.icon,
//     required this.tint,
//     required this.valueColor,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 34,
//           height: 34,
//           decoration: BoxDecoration(
//             color: tint.withOpacity(0.10),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(icon, color: tint, size: 19),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 value,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   color: valueColor,
//                   fontWeight: FontWeight.w900,
//                   fontSize: 18,
//                   height: 1.0,
//                 ),
//               ),
//               const SizedBox(height: 3),
//               Text(
//                 label,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   color: _muted,
//                   fontWeight: FontWeight.w800,
//                   fontSize: 12.2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
