// import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
// import 'package:deehelp/old_core/ui/theme/dimens.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class RegisteredTileInfo extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String value;
//   const RegisteredTileInfo({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(
//           icon,
//           color: Colors.white.withValues(alpha: 0.9),
//           size: Dimens.size24.w,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: context.appTextStyles.sectionSubTitle1.copyWith(
//                   color: Colors.white.withValues(alpha: 0.7),
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 0.5,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 value,
//                 style: context.appTextStyles.sectionTitle.copyWith(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
