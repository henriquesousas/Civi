import 'package:flutter/material.dart';

extension DialogExtension on BuildContext {
  Future<bool> showQuestionDialog(
    String title,
    String message, {
    String textConfirmButton = "Sim",
    String textCancelButton = "Não",
  }) async {
    final result = await showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(
          title,
          style: Theme.of(this).textTheme.titleMedium,
        ),
        content: Text(
          message,
        ),
        actions: [
          TextButton(
            child: Text(textCancelButton),
            onPressed: () => Navigator.of(ctx).pop(false),
          ),
          TextButton(
            child: Text(textConfirmButton),
            onPressed: () => Navigator.of(ctx).pop(true),
          ),
        ],
      ),
    );

    return result ?? false;
  }
}
