// import 'package:flutter/material.dart';
//
// class DialogService {
//   static Future<T?> showCustomDialog<T>({
//     required BuildContext context,
//     required Widget dialog,
//   }) {
//     return showDialog<T>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) => dialog,
//     );
//   }
//
//   static void showErrorDialog({
//     required BuildContext context,
//     required String message,
//   }) {
//     showCustomDialog(
//       context: context,
//       dialog: AlertDialog(
//         title: const Row(
//           children: [
//             Icon(Icons.error, color: Colors.red),
//             SizedBox(width: 8),
//             Text('Error'),
//           ],
//         ),
//         content: Text(message),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }
// }
