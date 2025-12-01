// import 'package:deehelp/core/theme/app_text_styles.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/theme/app_colors.dart';
// import '../../../../occurrence/domain/utils_date.dart';
// import '../../../domain/entities/product.dart';
//
// class MyProductsTileHeader extends StatelessWidget {
//   final Product product;
//
//   const MyProductsTileHeader({
//     super.key,
//     required this.product,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 5,
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               UtilsDate.format(product.createdAt!),
//               style: context.appTextStyles.caption2Style.copyWith(
//                 color: AppColors.darkGreyColor,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             // StatusBadgeWidget(status: product.status),
//           ],
//         ),
//         const Divider(color: AppColors.lightGreyColor30, height: 1),
//       ],
//     );
//   }
// }
