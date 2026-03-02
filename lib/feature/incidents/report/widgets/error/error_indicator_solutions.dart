// import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
// import 'package:deehelp/old_core/ui/theme/dimens.dart';
// import 'package:deehelp/feature/incidents/report/widgets/error/error_solution_tile.dart';
// import 'package:flutter/material.dart';

// class ErrorIndicatorSolutions extends StatelessWidget {
//   const ErrorIndicatorSolutions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: Dimens.size20,
//         vertical: Dimens.size20,
//       ),
//       padding: const EdgeInsets.all(Dimens.size20),
//       decoration: BoxDecoration(
//         color: Colors.white.withValues(alpha: 0.08),
//         borderRadius: BorderRadius.circular(Dimens.defaultRadius),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.lightbulb_outline,
//                 color: Colors.white.withValues(alpha: 0.8),
//                 size: Dimens.size20,
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 'SUGESTÕES',
//                 style: context.appTextStyles.bodyTextStyle1.copyWith(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white.withValues(alpha: 0.8),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           const ErrorSolutionTile(text: 'Verifique sua conexão com a internet'),
//           const ErrorSolutionTile(text: 'Tente novamente em alguns segundos'),
//           const ErrorSolutionTile(
//             text: 'Reinicie o aplicativo se o problema persistir',
//           ),
//         ],
//       ),
//     );
//   }
// }
