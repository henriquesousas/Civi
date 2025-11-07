import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors_v2.dart';

class AlertDialogQuestion extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmButton;
  final String? cancelButton;
  final VoidCallback? onConfirmButton;
  final VoidCallback? onCancelButton;
  const AlertDialogQuestion(
      {super.key,
      required this.title,
      required this.message,
      this.confirmButton,
      this.cancelButton,
      this.onConfirmButton,
      this.onCancelButton});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: context.screenWidth,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: context.textMediumSmall
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    message,
                    style: context.textSmall.copyWith(
                      color: AppColorsV2.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Divider(
              color: AppColorsV2.greyColor,
              height: 1,
            ),
            const SizedBox(height: 12),
            Container(
              width: context.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: onCancelButton,
                    child: Text(
                      cancelButton ?? "",
                      style: context.textRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColorsV2.primary,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onConfirmButton,
                    child: Text(
                      confirmButton ?? "",
                      style: context.textRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColorsV2.primary,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
