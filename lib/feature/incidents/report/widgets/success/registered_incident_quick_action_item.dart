// import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
// import 'package:deehelp/old_core/ui/theme/dimens.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class RegisteredIncidentQuickActionItem extends StatelessWidget {
//   final IconData icon;
//   final String value;
//   final String label;
//   final VoidCallback press;
//   const RegisteredIncidentQuickActionItem(
//       {super.key,
//       required this.icon,
//       required this.value,
//       required this.label,
//       required this.press});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: () {
//           HapticFeedback.lightImpact();
//           press();
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Container(
//                 width: Dimens.size36.w,
//                 height: Dimens.size36.h,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withValues(alpha: 0.2),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(icon, color: Colors.white, size: 20),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 value,
//                 style: context.appTextStyles.sectionTitle.copyWith(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 label,
//                 style: context.appTextStyles.sectionSubTitle1.copyWith(
//                   color: Colors.white.withValues(alpha: 0.7),
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 0.5,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
