import 'package:flutter/material.dart';

import '../theme/constants.dart';

// Future<dynamic> customModalBottomSheet(
//   BuildContext context, {
//   bool isDismissible = true,
//   double? height,
//   required Widget child,
// }) {
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
//       // height: height ?? MediaQuery.of(context).size.height * 0.75,
//       height: height,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           ),
//           child,
//         ],
//       ),
//     ),
//   );
// }

Future<dynamic> customModalBottomSheet(
  BuildContext context, {
  bool isDismissible = true,
  double? height,
  required Widget child,
}) {
  return showModalBottomSheet(
    context: context,
    clipBehavior: Clip.hardEdge,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(defaultBorderRadius * 2),
        topRight: Radius.circular(defaultBorderRadius * 2),
      ),
    ),
    builder: (context) => IntrinsicHeight(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Flexible(child: child),
          ],
        ),
      ),
    ),
  );
}

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
//     builder: (context) => IntrinsicHeight(
//       child: Container(
//         constraints: BoxConstraints(
//           maxHeight: height ?? maxHeight,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(height: 12),
//             Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Expanded(child: child),
//           ],
//         ),
//       ),
//     ),
//   );
// }
