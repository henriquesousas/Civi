// import 'package:deehelp/core/extension/color_extension.dart';
// import 'package:flutter/material.dart';

// import 'community_tips_action_card.dart';

// class TipRow extends StatelessWidget {
//   final CommunityTip tip;
//   const TipRow({super.key, required this.tip});

//   @override
//   Widget build(BuildContext context) {
//     const ink = Color(0xFF1F2A37);
//     const muted = Color(0xFF6B7280);

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: context.primaryColor.withOpacity(0.12),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(
//             tip.icon,
//             size: 18,
//             color: context.primaryColor,
//           ),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 tip.title,
//                 style: const TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w900,
//                   color: ink,
//                   height: 1.15,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 tip.subtitle,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: muted,
//                   fontWeight: FontWeight.w600,
//                   height: 1.2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
