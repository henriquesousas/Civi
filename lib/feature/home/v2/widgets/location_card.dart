// import 'package:flutter/material.dart';

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
//                     "Osasco agora",
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
//                   "Bairros",
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
