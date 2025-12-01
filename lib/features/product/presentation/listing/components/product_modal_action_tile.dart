// import 'package:flutter/material.dart';
//
// import '../../../../../core/theme/app_colors.dart';
//
// class ProductModalActionTile extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//   final Color color;
//   final VoidCallback onTap;
//   final bool showDivider;
//   const ProductModalActionTile(
//       {super.key,
//       required this.icon,
//       required this.title,
//       required this.subtitle,
//       required this.color,
//       required this.onTap,
//       required this.showDivider});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           leading: Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: color.withValues(alpha: 0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               icon,
//               color: color,
//               size: 20,
//             ),
//           ),
//           title: Text(
//             title,
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.textPrimary,
//                 ),
//           ),
//           subtitle: Text(
//             subtitle,
//             // style: Theme.of(context).textTheme.bodySmall?.copyWith(
//             //   color: AppColors.textTertiary,
//             // ),
//           ),
//           trailing: Container(
//             padding: const EdgeInsets.all(4),
//             decoration: BoxDecoration(
//               // color: AppColors.background,
//               shape: BoxShape.circle,
//               border: Border.all(color: AppColors.lightGreyColor30),
//             ),
//             child: const Icon(
//               Icons.arrow_forward_ios_rounded,
//               size: 12,
//               color: AppColors.textSecondary,
//             ),
//           ),
//           onTap: onTap,
//         ),
//         if (showDivider)
//           const Padding(
//             padding: EdgeInsets.only(left: 60, right: 16),
//             child: Divider(
//               height: 1,
//               color: AppColors.lightGreyColor30,
//             ),
//           ),
//       ],
//     );
//     ;
//   }
// }
