// import 'package:deehelp/feature/home/v2/models.dart';
// import 'package:flutter/material.dart';

// class DriverMiniCard extends StatelessWidget {
//   final RiskDriver driver;
//   final VoidCallback? onTap;

//   const DriverMiniCard({
//     super.key,
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
//                 const SizedBox(width: 3),
//                 Text(
//                   driver.value,
//                   style: TextStyle(
//                     color: vc,
//                     fontWeight: FontWeight.w900,
//                     fontSize: 16,
//                     height: 1,
//                   ),
//                 ),
//                 const SizedBox(width: 3),
//                 Expanded(
//                   child: Text(
//                     "registros",
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       color: _muted,
//                       fontWeight: FontWeight.w800,
//                       fontSize: 12,
//                     ),
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
