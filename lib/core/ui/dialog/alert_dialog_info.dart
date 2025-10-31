import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';

class AlertDialogInfo extends StatelessWidget {
  final String title;
  final String message;
  final String titleButton;
  const AlertDialogInfo(
      {super.key,
      required this.title,
      required this.message,
      required this.titleButton});

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
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.greyColor,
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
                    onPressed: () => context.pop(),
                    child: Text(
                      titleButton,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
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

//TODO: Transformar em um gradiente icon
// Container(
//   padding: const EdgeInsets.all(12),
//   decoration: BoxDecoration(
//     color: AppColors.error.withValues(alpha: 0.1),
//     borderRadius: BorderRadius.circular(12),
//   ),
//   child: const Icon(
//     Icons.warning_rounded,
//     color: AppColors.error,
//     size: 24,
//   ),
// ),
