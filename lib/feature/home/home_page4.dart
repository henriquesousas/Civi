// import 'package:flutter/material.dart';

// class AlertDetailsScreen extends StatelessWidget {
//   const AlertDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F8FC),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color(0xFFF7F8FC),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_rounded,
//               color: Color(0xFF151A28)),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Alerta da comunidade",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w700,
//             color: Color(0xFF151A28),
//           ),
//         ),
//       ),
//       bottomNavigationBar: const _BottomActions(),
//       body: ListView(
//         padding: const EdgeInsets.fromLTRB(16, 10, 16, 120),
//         children: const [
//           _AlertHero(),
//           SizedBox(height: 16),
//           _LocationCard(),
//           SizedBox(height: 16),
//           _CommunityCard(),
//           SizedBox(height: 16),
//           _SituationCard(),
//         ],
//       ),
//     );
//   }
// }

// class _AlertHero extends StatelessWidget {
//   const _AlertHero();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: const Color(0xFFE9EEF6)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             decoration: BoxDecoration(
//               color: const Color(0xFFEAF1FF),
//               borderRadius: BorderRadius.circular(999),
//             ),
//             child: const Text(
//               "Alagamento",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFF2B5BEE),
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             "Alagamento deixando trânsito lento",
//             style: TextStyle(
//               fontSize: 20,
//               height: 1.25,
//               fontWeight: FontWeight.w700,
//               color: Color(0xFF151A28),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Osasco • Km 18",
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF697386),
//             ),
//           ),
//           const SizedBox(height: 6),
//           const Text(
//             "Hoje • 10:05",
//             style: TextStyle(
//               fontSize: 13,
//               color: Color(0xFF8B95A7),
//             ),
//           ),
//           const SizedBox(height: 14),
//           Row(
//             children: const [
//               _StatusPill(
//                 text: "Impacto moderado",
//                 color: Color(0xFFFFF6E8),
//                 textColor: Color(0xFFC98312),
//               ),
//               SizedBox(width: 10),
//               _StatusPill(
//                 text: "Expira em 13h",
//                 color: Color(0xFFEAF8F0),
//                 textColor: Color(0xFF1E8E5A),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class _LocationCard extends StatelessWidget {
//   const _LocationCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: const Color(0xFFE9EEF6)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             "Local",
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w700,
//               color: Color(0xFF151A28),
//             ),
//           ),
//           SizedBox(height: 12),
//           Text(
//             "Osasco • Km 18",
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF697386),
//             ),
//           ),
//           SizedBox(height: 6),
//           Text(
//             "Próximo ao acesso principal",
//             style: TextStyle(
//               fontSize: 13,
//               color: Color(0xFF8B95A7),
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             "2,1 km de você",
//             style: TextStyle(
//               fontSize: 12.5,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF2B5BEE),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _CommunityCard extends StatelessWidget {
//   const _CommunityCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: const Color(0xFFE9EEF6)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           _Metric(label: "Confirmações", value: "34"),
//           _Metric(label: "Acompanhando", value: "12"),
//           _Metric(label: "Atualizado", value: "4 min"),
//         ],
//       ),
//     );
//   }
// }

// class _SituationCard extends StatelessWidget {
//   const _SituationCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: const Color(0xFFE9EEF6)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             "Situação reportada",
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w700,
//               color: Color(0xFF151A28),
//             ),
//           ),
//           SizedBox(height: 14),
//           _SituationRow("Acúmulo de água na via"),
//           _SituationRow("Trânsito lento no trecho"),
//           _SituationRow("Atenção para motos"),
//         ],
//       ),
//     );
//   }
// }

// class _SituationRow extends StatelessWidget {
//   final String text;

//   const _SituationRow(this.text);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           const Icon(Icons.circle, size: 8, color: Color(0xFF2B5BEE)),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 13.5,
//                 color: Color(0xFF697386),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Metric extends StatelessWidget {
//   final String label;
//   final String value;

//   const _Metric({
//     required this.label,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w800,
//             color: Color(0xFF151A28),
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 12.5,
//             color: Color(0xFF8B95A7),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _StatusPill extends StatelessWidget {
//   final String text;
//   final Color color;
//   final Color textColor;

//   const _StatusPill({
//     required this.text,
//     required this.color,
//     required this.textColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(999),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.w700,
//           color: textColor,
//         ),
//       ),
//     );
//   }
// }

// class _BottomActions extends StatelessWidget {
//   const _BottomActions();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         border: Border(
//           top: BorderSide(color: Color(0xFFE9EEF6)),
//         ),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: SizedBox(
//               height: 52,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF2B5BEE),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: const Text(
//                   "Confirmar alerta",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 14.5,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           _IconButton(icon: Icons.visibility_outlined),
//           const SizedBox(width: 8),
//           _IconButton(icon: Icons.ios_share_outlined),
//         ],
//       ),
//     );
//   }
// }

// class _IconButton extends StatelessWidget {
//   final IconData icon;

//   const _IconButton({required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 52,
//       height: 52,
//       decoration: BoxDecoration(
//         color: const Color(0xFFF5F7FC),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Icon(icon, color: const Color(0xFF151A28)),
//     );
//   }
// }
