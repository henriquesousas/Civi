// import 'package:flutter/material.dart';

// import '../occurrence_page.dart';
// import 'occurrence_description.dart';
// import 'occurrence_info_row_widget.dart';

// class OccurrenceItemWidget extends StatelessWidget {
//   final Ocorrencia occurrence;
//   const OccurrenceItemWidget({super.key, required this.occurrence});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Column(
//         // spacing: 8,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//             occurrence.nomeVeiculo,
//             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   fontWeight: FontWeight.normal,
//                   height: 1.2,
//                 ),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           const SizedBox(height: 10),
//           if (occurrence.descricao != null &&
//               occurrence.descricao!.isNotEmpty) ...[
//             // const SizedBox(height: 12),
//             OccurrenceDescription(description: occurrence.descricao!)
//           ],
//           const SizedBox(height: 10),
//           OccurrenceInfoRowWidget(
//             icon: Icons.location_on_outlined,
//             text: occurrence.local,
//             color: Colors.blue[600]!,
//           ),

//           // const SizedBox(height: 10),
//           // const StatusBadgeWidget(status: ProductSatus.active),
//         ],
//       ),
//     );
//   }
// }
