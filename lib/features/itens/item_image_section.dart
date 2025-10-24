// import 'package:flutter/material.dart';
// import 'package:deehelp/shared/extensions/screen_size_extension.dart';
//
// import '../../../../app/theme/app_colors.dart';
// import 'dotted_container.dart';
//
// class ItemImageSection extends StatelessWidget {
//   const ItemImageSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: AppColors.primary.withValues(alpha: 0.1),
//                   borderRadius: BorderRadius.circular(90),
//                   border: Border.all(
//                     color: AppColors.primary.withValues(alpha: 0.3),
//                     width: 2,
//                   ),
//                 ),
//                 // child: const Icon(
//                 //   Icons.person,
//                 //   color: AppColors.primary,
//                 //   size: 60,
//                 // ),
//                 // child: ClipRRect(
//                 //   borderRadius: BorderRadius.circular(20),
//                 //   child: Image.asset(
//                 //     ImageConfig.fakeCarro3,
//                 //     fit: BoxFit.cover,
//                 //   ),
//                 // ),
//                 child: DottedContainer(
//                   height: context.percentHeight(0.08),
//                   width: 0,
//                 ),
//               ),
//               // Positioned(
//               //   bottom: 0,
//               //   right: 0,
//               //   child: Container(
//               //     padding: const EdgeInsets.all(8),
//               //     decoration: BoxDecoration(
//               //       color: AppColors.primary,
//               //       borderRadius: BorderRadius.circular(20),
//               //       border: Border.all(color: Colors.white, width: 2),
//               //     ),
//               //     child: const Icon(
//               //       Icons.camera_alt,
//               //       color: Colors.white,
//               //       size: 16,
//               //     ),
//               //   ),
//               // ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
