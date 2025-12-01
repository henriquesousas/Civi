// import 'package:deehelp/core/widgets/badge/ui_badge_widget.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/theme/app_colors.dart';
// import '../../../domain/entities/product.dart';
//
// class MyProductsInfoBadge extends StatelessWidget {
//   final Product product;
//
//   const MyProductsInfoBadge({
//     super.key,
//     required this.product,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> badgeData = [];
//
//     if (product.brand.isNotEmpty) {
//       badgeData.add({
//         'text': product.brand,
//         'icon': Icons.branding_watermark_outlined,
//         // 'color': AppColors.primaryColor,
//         'color': AppColors.greyColor,
//       });
//     }
//
//     if (product.color.isNotEmpty) {
//       badgeData.add({
//         'text': product.color,
//         'icon': Icons.color_lens_outlined,
//         // 'color': const Color(0xFFFF6B35),
//         'color': AppColors.greyColor,
//       });
//     }
//
//     if (badgeData.isEmpty) {
//       return const SizedBox.shrink();
//     }
//
//     return Wrap(
//       spacing: 8,
//       runSpacing: 6,
//       children: badgeData
//           .map(
//             (data) => UIBadgeWidget(
//               text: data['text'] as String,
//               icon: data['icon'] as IconData,
//               color: data['color'] as Color,
//             ),
//           )
//           .toList(),
//     );
//   }
// }
