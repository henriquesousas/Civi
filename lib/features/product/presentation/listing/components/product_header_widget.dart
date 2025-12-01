// import 'package:flutter/material.dart';
//
// import '../../../domain/entities/product.dart';
//
// class ProductHeaderWidget extends StatelessWidget {
//   final Product item;
//   const ProductHeaderWidget({super.key, required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             item.name,
//             style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                   // fontSize: 18,
//                 ),
//           ),
//           Text(item.code, style: Theme.of(context).textTheme.bodySmall),
//         ],
//       ),
//     );
//   }
// }
