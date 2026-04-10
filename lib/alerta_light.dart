// import 'package:flutter/material.dart';

// class AlertTypeBottomSheetLight {
//   static Future<void> show(
//     BuildContext context, {
//     required VoidCallback onSuspiciousTap,
//     required VoidCallback onRobberyTap,
//   }) {
//     return showModalBottomSheet(
//       context: context,
//       isScrollControlled: false,
//       backgroundColor: Colors.transparent,
//       builder: (_) {
//         return _AlertTypeContent(
//           onSuspiciousTap: onSuspiciousTap,
//           onRobberyTap: onRobberyTap,
//         );
//       },
//     );
//   }
// }

// class _AlertTypeContent extends StatelessWidget {
//   final VoidCallback onSuspiciousTap;
//   final VoidCallback onRobberyTap;

//   const _AlertTypeContent({
//     required this.onSuspiciousTap,
//     required this.onRobberyTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const backgroundColor = Colors.white;
//     const borderColor = Color(0xFFE7ECF3);
//     const textPrimary = Color(0xFF111827);
//     const textSecondary = Color(0xFF6B7280);

//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
//       decoration: const BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(24),
//         ),
//       ),
//       child: SafeArea(
//         top: false,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 42,
//               height: 5,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFD7DEE8),
//                 borderRadius: BorderRadius.circular(999),
//               ),
//             ),
//             const SizedBox(height: 18),
//             Text(
//               'Criar alerta',
//               style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                     color: textPrimary,
//                     fontWeight: FontWeight.w800,
//                   ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               'Escolha o tipo de alerta que deseja reportar',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     color: textSecondary,
//                     height: 1.4,
//                   ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: _AlertCardLight(
//                     title: 'Atividade suspeita',
//                     description:
//                         'Movimentação estranha ou comportamento suspeito',
//                     icon: Icons.visibility_rounded,
//                     onTap: () {
//                       Navigator.pop(context);
//                       onSuspiciousTap();
//                     },
//                     borderColor: borderColor,
//                     titleColor: textPrimary,
//                     descriptionColor: textSecondary,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: _AlertCardLight(
//                     title: 'Roubo ou tentativa',
//                     description: 'Assalto, abordagem ou quebra de vidro',
//                     icon: Icons.warning_amber_rounded,
//                     onTap: () {
//                       Navigator.pop(context);
//                       onRobberyTap();
//                     },
//                     highlight: true,
//                     borderColor: borderColor,
//                     titleColor: textPrimary,
//                     descriptionColor: textSecondary,
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

// class _AlertCardLight extends StatelessWidget {
//   final String title;
//   final String description;
//   final IconData icon;
//   final VoidCallback onTap;
//   final bool highlight;
//   final Color borderColor;
//   final Color titleColor;
//   final Color descriptionColor;

//   const _AlertCardLight({
//     required this.title,
//     required this.description,
//     required this.icon,
//     required this.onTap,
//     required this.borderColor,
//     required this.titleColor,
//     required this.descriptionColor,
//     this.highlight = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const primaryBlue = Color(0xFF2B5BEE);

//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(20),
//         onTap: onTap,
//         child: Ink(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: highlight ? primaryBlue : borderColor,
//               width: highlight ? 1.4 : 1,
//             ),
//             color:
//                 highlight ? const Color(0xFFF2F6FF) : const Color(0xFFF8FAFC),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.03),
//                 blurRadius: 14,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 46,
//                 height: 46,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                   color: highlight
//                       ? primaryBlue.withOpacity(0.10)
//                       : const Color(0xFFEEF2F7),
//                 ),
//                 child: Icon(
//                   icon,
//                   color: highlight ? primaryBlue : const Color(0xFF4B5563),
//                   size: 24,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 title,
//                 style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                       color: titleColor,
//                       fontWeight: FontWeight.w800,
//                     ),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                       color: descriptionColor,
//                       height: 1.4,
//                     ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
