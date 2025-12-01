// import 'package:deehelp/core/theme/app_text_styles.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/theme/app_colors.dart';
// import '../../../domain/entities/product.dart';
//
// class MyProductsTileFooter extends StatelessWidget {
//   final Product product;
//
//   const MyProductsTileFooter({
//     super.key,
//     required this.product,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
//       decoration: BoxDecoration(
//           color: AppColors.lightGreyColor30.withValues(alpha: 0.4),
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: AppColors.lightGreyColor30, width: 1)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.tag_outlined,
//                         size: 14,
//                         color: AppColors.primaryColor,
//                       ),
//                       const SizedBox(width: 6),
//                       Flexible(
//                         child: Text(
//                           'Placa: ${product.code}',
//                           style: context.appTextStyles.caption1Style.copyWith(
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.primaryColor,
//                             fontSize: 13,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Container(
//               padding: const EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryColor.withValues(alpha: 0.1),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: const Icon(
//                 Icons.arrow_forward_ios_rounded,
//                 size: 8,
//                 color: AppColors.primaryColor,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
