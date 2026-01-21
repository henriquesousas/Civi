// import 'package:deehelp/core/ui/theme/app_colors.dart';
// import 'package:deehelp/core/ui/theme/app_text_styles.dart';
// import 'package:flutter/material.dart';

// class SearchChip extends StatelessWidget {
//   const SearchChip({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Tipo de Veículo',
//           style: context.appTextStyles.bodyTextStyle2.copyWith(
//             color: AppColors.textColorBody,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 12),
//         Wrap(
//           spacing: 8,
//           runSpacing: 8,
//           children: tiposVeiculo.map((tipo) {
//             final isSelected = filtro.tipoVeiculo == tipo['value'];

//             return FilterChip(
//               label: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Icon(tipo['icon'] as IconData, size: 18),
//                   UIMyAssetsImageWidget(
//                     isSvg: true,
//                     assetPath: tipo['icon'] as String,
//                     width: Dimens.size18.r,
//                     height: Dimens.size18.r,
//                     color: isSelected
//                         ? AppColors.primaryColor
//                         : Theme.of(context).colorScheme.onSurfaceVariant,
//                   ),
//                   const SizedBox(width: 6),
//                   Text(
//                     tipo['label'] as String,
//                     style: context.appTextStyles.bodyTextStyle1.copyWith(
//                       fontWeight:
//                           isSelected ? FontWeight.bold : FontWeight.normal,
//                       color: isSelected
//                           ? AppColors.primaryColorDark
//                           : AppColors.textColorBody,
//                     ),
//                   ),
//                 ],
//               ),
//               selected: isSelected,
//               onSelected: (selected) {
//                 ref.read(filtroPesquisaProvider.notifier).state =
//                     filtro.copyWith(
//                         tipoVeiculo: selected ? tipo['value'] as String : null);
//               },
//               selectedColor: AppColors.primaryColor.withValues(alpha: 0.3),
//               checkmarkColor: AppColors.primaryColor,
//               backgroundColor: Colors.grey[100],
//               shape: StadiumBorder(
//                 side: BorderSide(
//                   color:
//                       isSelected ? AppColors.primaryColor : Colors.grey[300]!,
//                   width: 1,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
