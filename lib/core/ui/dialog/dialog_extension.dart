import 'package:deehelp/core/ui/dialog/alert_dialog_info.dart';
import 'package:flutter/material.dart';

extension DialogExtension on BuildContext {
  Future<T?> _showCustomDialog<T>({
    required Widget content,
    bool barrierDismissible = false,
  }) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(50),
        child: content,
      ),
    );
  }

  void showDialogWarning(
    final String title,
    final String message, {
    String titleButton = "FECHAR",
  }) {
    _showCustomDialog(
      content: AlertDialogInfo(
        title: title,
        message: message,
        titleButton: titleButton,
      ),
    );
  }
}
