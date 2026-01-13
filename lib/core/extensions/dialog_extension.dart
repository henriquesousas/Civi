import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

enum DialogType {
  success,
  error,
}

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
          style: appTextStyles.sectionTitle,
        ),
        content: Text(
          message,
          style: appTextStyles.bodyTextStyle1.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              textCancelButton,
              style: appTextStyles.buttonTextStyle1.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            onPressed: () => Navigator.of(ctx).pop(false),
          ),
          TextButton(
            child: Text(
              textConfirmButton,
              style: appTextStyles.buttonTextStyle1.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  void showDilaog(String title, String message) {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String message, {DialogType type = DialogType.success}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: appTextStyles.sectionTitle3.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: type == DialogType.success
            ? AppColors.successColor
            : AppColors.errorColor,
        // behavior: SnackBarBehavior.fixed,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
