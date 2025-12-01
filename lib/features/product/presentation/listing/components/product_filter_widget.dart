// import 'package:deehelp/core/theme/app_colors.dart';
// import 'package:flutter/material.dart';
//
// class ProductFilterWidget extends StatelessWidget {
//   final String selectedFilter;
//   final ValueChanged<String> onFilterChanged;
//
//   const ProductFilterWidget(
//       {super.key, required this.selectedFilter, required this.onFilterChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     final filters = ['Todos', 'Carro', 'Motocicleta', 'Caminhão'];
//
//     return SizedBox(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: filters.map((filter) {
//           final isSelected = selectedFilter == filter;
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(90),
//                 onTap: () => onFilterChanged(filter),
//                 child: Container(
//                   constraints: const BoxConstraints(minWidth: 70),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: isSelected
//                         ? AppColors.primaryColor
//                         : Colors.transparent,
//                     borderRadius: BorderRadius.circular(100),
//                     border: Border.all(
//                       color: isSelected
//                           ? AppColors.primaryColor
//                           : Colors.grey[300]!,
//                       width: 1.2,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       filter,
//                       style: Theme.of(context).textTheme.labelMedium?.copyWith(
//                             fontWeight: FontWeight.w600,
//                             color: isSelected ? Colors.white : Colors.grey[700],
//                           ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
