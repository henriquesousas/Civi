import 'package:flutter/material.dart';

import '../theme/constants.dart';
//
// Future<dynamic> customModalBottomSheet(
//   BuildContext context, {
//   bool isDismissible = true,
//   double? height,
//   required Widget child,
// }) {
//   final maxHeight = MediaQuery.of(context).size.height * 0.85;
//
//   return showModalBottomSheet(
//     context: context,
//     clipBehavior: Clip.hardEdge,
//     isScrollControlled: true,
//     isDismissible: isDismissible,
//     enableDrag: isDismissible,
//     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(defaultBorderRadius * 2),
//         topRight: Radius.circular(defaultBorderRadius * 2),
//       ),
//     ),
//     builder: (context) => SizedBox(
//       height: height ?? maxHeight,
//       child: Column(
//         children: [
//           const SizedBox(height: 12),
//           Center(
//             child: Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: child,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Future<dynamic> customModalBottomSheet(
  BuildContext context, {
  bool isDismissible = true,
  double? maxHeight,
  required Widget child,
}) {
  return showModalBottomSheet(
    context: context,
    clipBehavior: Clip.hardEdge,
    isScrollControlled: true, // IMPORTANTE para conteúdo variável
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(defaultBorderRadius * 2),
        topRight: Radius.circular(defaultBorderRadius * 2),
      ),
    ),
    builder: (context) => Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // CRUCIAL para altura flexível
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            // Use Flexible para conteúdo variável
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: child,
            ),
          ),
        ],
      ),
    ),
  );
}
