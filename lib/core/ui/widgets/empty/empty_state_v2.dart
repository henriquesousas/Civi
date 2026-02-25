// import 'package:deehelp/core/extension/color_extension.dart';
// import 'package:deehelp/core/theme/export_theme.dart';
// import 'package:deehelp/core/ui/styles/export_style.dart';
// import 'package:deehelp/core/ui/widgets/icon/highlight_icon.dart';
// import 'package:flutter/material.dart';

// class EmptyStateV2 extends StatelessWidget {
//   final Icon highlightIcon;
//   final String title;
//   final String subtitle;
//   final String buttonText;
//   final VoidCallback press;
//   const EmptyStateV2(
//       {super.key,
//       required this.highlightIcon,
//       required this.title,
//       required this.subtitle,
//       required this.buttonText,
//       required this.press});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: LayoutSpacingSize.section),
//       padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: context.outlineVariantColor),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x142B5BEE),
//             blurRadius: 18,
//             offset: Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           HighlightIcon(
//             containerSize: IconContainerSizes.xl,
//             radius: RadiusSize.xl,
//             icon: Icon(
//               Icons.radar_rounded,
//               size: IconSizes.xxl,
//               color: context.primaryColor,
//             ),
//           ),
//           const SizedBox(height: SpacingSize.md),
//           Text(
//             'Nenhuma ocorrência recente',
//             textAlign: TextAlign.center,
//             style: context.appText.headermd,
//           ),
//           const SizedBox(height: SpacingSize.sm),
//           Text(
//             'Não encontramos registros na sua região no momento.\n'
//             'Isso é um bom sinal 👌',
//             textAlign: TextAlign.center,
//             style: context.appText.caption.copyWith(
//               fontWeight: FontWeight.w600,
//               height: 1.35,
//               color: context.secondaryColor,
//             ),
//           ),
//           const SizedBox(height: SpacingSize.sm),
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 14,
//               vertical: 10,
//             ),
//             decoration: BoxDecoration(
//               color: context.secondaryContainer,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: context.outlineVariantColor),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   Icons.campaign_outlined,
//                   size: IconSizes.md,
//                   color: context.secondaryColor,
//                 ),
//                 const SizedBox(width: SpacingSize.sm),
//                 Expanded(
//                   child: Text(
//                     'Se algo acontecer, registre para avisar a comunidade',
//                     style: context.appText.caption.copyWith(
//                       fontWeight: FontWeight.w700,
//                       color: context.secondaryColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
