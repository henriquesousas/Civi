// import 'package:flutter/material.dart';

// class EditableMultilineFieldTile extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;
//   final VoidCallback onEdit;

//   final double minHeight;
//   final int maxPreviewLines;

//   const EditableMultilineFieldTile({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.value,
//     required this.onEdit,
//     this.minHeight = 120,
//     this.maxPreviewLines = 6,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _primary = Color(0xFF2B5BEE);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(22),
//       splashColor: _primary.withOpacity(0.06),
//       onTap: onEdit,
//       child: Container(
//         constraints: BoxConstraints(minHeight: minHeight),
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: _ink.withOpacity(0.08),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, color: _ink, size: 20),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     label,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w800,
//                       color: _muted,
//                       letterSpacing: 0.2,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     value.isEmpty
//                         ? 'Toque para adicionar uma observação…'
//                         : value,
//                     maxLines: maxPreviewLines,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 14,
//                       height: 1.35,
//                       fontWeight: FontWeight.w600,
//                       color: value.isEmpty ? _muted : _ink,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 10),
//             Container(
//               width: 36,
//               height: 36,
//               decoration: BoxDecoration(
//                 color: _primary.withOpacity(0.10),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Icon(Icons.edit_outlined, color: _primary, size: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
