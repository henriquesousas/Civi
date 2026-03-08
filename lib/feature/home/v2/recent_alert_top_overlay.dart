// import 'dart:async';
// import 'package:flutter/material.dart';

// class RecentAlerTopOverlay extends StatefulWidget {
//   final VoidCallback onTap;
//   final VoidCallback onClosed;

//   /// Conteúdos (deixei parametrizável, mas já com defaults do seu exemplo)
//   final String title;
//   final String subtitle;

//   /// Tempo total para fechar (50s)
//   final Duration ttl;

//   /// Altura do card em % da tela (0.40 = 40%)
//   final double heightFactor;

//   const RecentAlerTopOverlay({
//     super.key,
//     required this.onTap,
//     required this.onClosed,
//     this.title = 'Roubo registrado agora',
//     this.subtitle = 'há 12 min • Centro • 1.8 km de você',
//     this.ttl = const Duration(seconds: 50),
//     this.heightFactor = 0.40,
//   });

//   @override
//   State<RecentAlerTopOverlay> createState() => _RecentAlerTopOverlayState();
// }

// class _RecentAlerTopOverlayState extends State<RecentAlerTopOverlay>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   Timer? _closeTimer;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: widget.ttl,
//       value: 1.0, // começa cheio e vai esvaziando
//     )..reverse(from: 1.0);

//     _closeTimer = Timer(widget.ttl, () {
//       if (mounted) widget.onClosed();
//     });
//   }

//   @override
//   void dispose() {
//     _closeTimer?.cancel();
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.sizeOf(context).height * widget.heightFactor;

//     // Identidade black + contraste
//     const cardBg = Color(0xFF0B0F1A);
//     const cardBorder = Color(0xFF1B2436);
//     const ink = Color(0xFFEAF0FF);
//     const muted = Color(0xFF9AA7C7);
//     const accent = Color(0xFFFF4D4D); // alerta/roubo

//     return SizedBox(
//       height: h,
//       width: double.infinity,
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(18),
//           onTap: widget.onTap,
//           child: Container(
//             decoration: BoxDecoration(
//               color: cardBg,
//               borderRadius: BorderRadius.circular(18),
//               border: Border.all(color: cardBorder, width: 1),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black54,
//                   blurRadius: 18,
//                   offset: Offset(0, 10),
//                 ),
//               ],
//             ),
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 // LEFT: ícone de alert
//                 Container(
//                   width: 48,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF11182A),
//                     borderRadius: BorderRadius.circular(14),
//                     border: Border.all(color: cardBorder),
//                   ),
//                   child: const Icon(
//                     Icons.report_gmailerrorred_rounded,
//                     color: accent,
//                     size: 26,
//                   ),
//                 ),
//                 const SizedBox(width: 14),

//                 // MIDDLE: textos
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.title,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           color: ink,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w800,
//                           letterSpacing: 0.2,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       Text(
//                         widget.subtitle,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           color: muted,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(width: 14),

//                 // RIGHT: barra de progresso vertical + contador
//                 _RightCountdownPill(
//                   controller: _controller,
//                   ttl: widget.ttl,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _RightCountdownPill extends StatelessWidget {
//   final AnimationController controller;
//   final Duration ttl;

//   const _RightCountdownPill({
//     required this.controller,
//     required this.ttl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const track = Color(0xFF10182A);
//     const trackBorder = Color(0xFF1B2436);
//     const fill = Color(0xFF2B5BEE); // seu azul
//     const text = Color(0xFFEAF0FF);
//     const muted = Color(0xFF9AA7C7);

//     return AnimatedBuilder(
//       animation: controller,
//       builder: (_, __) {
//         final remaining = (ttl.inSeconds * controller.value)
//             .clamp(0, ttl.inSeconds.toDouble());
//         final seconds = remaining.ceil();

//         return Container(
//           width: 64,
//           height: 86,
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: track,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: trackBorder),
//           ),
//           child: Column(
//             children: [
//               // contador
//               Text(
//                 '${seconds}s',
//                 style: const TextStyle(
//                   color: text,
//                   fontSize: 13,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(999),
//                   child: Stack(
//                     children: [
//                       // trilho
//                       Positioned.fill(
//                         child: Container(color: const Color(0xFF0B0F1A)),
//                       ),
//                       // preenchimento (de baixo pra cima)
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: FractionallySizedBox(
//                           heightFactor: controller.value, // 1->0
//                           widthFactor: 1,
//                           child: Container(color: fill),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               const Text(
//                 'fechar',
//                 style: TextStyle(
//                   color: muted,
//                   fontSize: 11,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
