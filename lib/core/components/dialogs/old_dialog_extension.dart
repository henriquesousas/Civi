// import 'package:deehelp/core/components/dialogs/alert_dialog_info.dart';
// import 'package:deehelp/core/components/dialogs/alert_dialog_question.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// extension DialogExtension on BuildContext {
//   Future<T?> _showCustomDialog<T>({
//     required Widget content,
//     bool barrierDismissible = false,
//   }) {
//     return showDialog<T>(
//       context: this,
//       barrierDismissible: barrierDismissible,
//       builder: (context) => Dialog(
//         backgroundColor: Colors.transparent,
//         insetPadding: const EdgeInsets.all(50),
//         child: content,
//       ),
//     );
//   }
//
//   void showDialogWarning(
//     final String title,
//     final String message, {
//     String titleButton = "FECHAR",
//   }) {
//     _showCustomDialog(
//       content: AlertDialogInfo(
//         title: title,
//         message: message,
//         titleButton: titleButton,
//       ),
//     );
//   }
//
//   Future<bool?> showDialogQuestion({
//     required final String title,
//     required final String message,
//     String confirmTitle = "SIM",
//     String cancelTitle = "NAO",
//     VoidCallback? onConfirmButton,
//   }) {
//     return _showCustomDialog<bool>(
//       barrierDismissible: false,
//       content: AlertDialogQuestion(
//         title: title,
//         message: message,
//         confirmButton: confirmTitle,
//         cancelButton: cancelTitle,
//         onCancelButton: () => pop(),
//         onConfirmButton: onConfirmButton ?? () => pop(),
//       ),
//     );
//   }
// }
