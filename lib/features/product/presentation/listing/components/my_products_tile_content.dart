// import 'package:deehelp/core/theme/app_colors.dart';
// import 'package:deehelp/core/theme/app_text_styles.dart';
// import 'package:deehelp/features/product/domain/entities/product.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/components/ui_my_network_image_widget.dart';
//
// class MyProductsTileContent extends StatelessWidget {
//   final Product product;
//   const MyProductsTileContent({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       spacing: 5,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         UIMyNetworkImageWidget(
//           imageUrl: product.image?.value ?? '',
//           width: 70,
//           height: 70,
//           // fit: BoxFit.cover,
//         ),
//         Expanded(
//           child: Column(
//             spacing: 8,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 product.name,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: context.appTextStyles.bodyTextStyle1.copyWith(
//                   fontWeight: FontWeight.w500,
//                   // color: AppColors.textColorBody,
//                 ),
//               ),
//               Text(
//                 product.code,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: context.appTextStyles.caption1Style.copyWith(
//                   color: AppColors.textSecondary,
//                 ),
//               ),
//               // MyProductsInfoBadge(product: product),
//               // StatusBadgeWidget(status: product.status),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
