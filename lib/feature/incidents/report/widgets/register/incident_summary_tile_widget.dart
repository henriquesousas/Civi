// import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
// import 'package:deehelp/old_core/ui/theme/dimens.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class IncidentSummaryTileWidget extends StatelessWidget {
//   final String label;
//   final String value;
//   const IncidentSummaryTileWidget(
//       {super.key, required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: Dimens.size70.w,
//           child: Text(
//             label,
//             style: context.appTextStyles.caption1Style.copyWith(
//               fontWeight: FontWeight.w600,
//               color: Colors.white.withValues(alpha: 0.7),
//               letterSpacing: 0.5,
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Text(
//             value.toUpperCase(),
//             style: context.appTextStyles.sectionSubTitle1.copyWith(
//               fontWeight: FontWeight.w700,
//               color: Colors.white,
//               letterSpacing: 0.3,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
