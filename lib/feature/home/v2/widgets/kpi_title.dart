// import 'package:flutter/material.dart';

// class KpiTile extends StatelessWidget {
//   final String label;
//   final String value;
//   final IconData icon;
//   final Color? valueColor;

//   const KpiTile({
//     super.key,
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
