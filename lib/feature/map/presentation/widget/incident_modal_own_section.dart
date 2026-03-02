// import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
// import 'package:deehelp/feature/map/presentation/widget/toogle_buttons.dart';
// import 'package:flutter/material.dart';

// import '../../../../old_core/ui/theme/app_colors.dart';
// import '../../../../old_core/ui/theme/dimens.dart';

// class IncidentModalOwnSection extends StatelessWidget {
//   const IncidentModalOwnSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // decoration: BoxDecoration(
//       //   color: AppColors.lightGreyColor,
//       //   borderRadius: BorderRadius.circular(4),
//       // ),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           color: AppColors.lightGreyColor30,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//             color: AppColors.lightGreyColor20,
//           )
//           // border: const Border(
//           //   bottom: BorderSide(
//           //     color: AppColors.lightGreyColor30,
//           //     width: 1.0,
//           //   ),
//           // ),
//           ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: Dimens.size10, vertical: Dimens.size20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           spacing: 5,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               decoration: BoxDecoration(
//                 color: AppColors.lightGreyColor30,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 "Àrea logada",
//                 style: context.appTextStyles.sectionTitle.copyWith(
//                   color: AppColors.dark,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               spacing: 5,
//               children: [
//                 const Icon(
//                   Icons.visibility_outlined,
//                   color: AppColors.textColorBody,
//                 ),
//                 Text(
//                   "Deixar visivel",
//                   style: context.appTextStyles.bodyTextStyle2.copyWith(
//                     color: AppColors.textColorBody,
//                   ),
//                 ),
//                 const Spacer(),
//                 const ToogleButtons(),
//               ],
//             ),

//             //LInha 2
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Icon(
//                   Icons.delete_outlined,
//                   color: AppColors.errorColor,
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Remover",
//                     style: context.appTextStyles.bodyTextStyle1.copyWith(
//                       color: AppColors.errorColorDark,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     textAlign: TextAlign.right,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
