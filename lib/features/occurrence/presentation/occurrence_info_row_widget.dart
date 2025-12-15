// import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
// import 'package:flutter/material.dart';

// class OccurrenceInfoRowWidget extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final Color color;
//   const OccurrenceInfoRowWidget(
//       {super.key, required this.icon, required this.text, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.percentWidth(0.5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // UIIConAlpha(
//           //   iconData: Icons.location_on_outlined,
//           //   iconSize: 12,
//           //   color: color,
//           //   borderRadius: 12,
//           //   padding: 6,
//           // ),
//           const SizedBox(width: 3),
//           Expanded(
//             child: Text(
//               text,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 color: Colors.grey[700],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
