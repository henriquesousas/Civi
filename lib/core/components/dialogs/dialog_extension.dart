import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
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

  void showSnackBar(String message, {DialogType type = DialogType.success}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: appTextStyles.sectionTitle,
        ),
        backgroundColor: type == DialogType.success
            ? const Color(0xFF1F2937)
            : AppColors.errorColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
