import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyStateWidget extends StatelessWidget {
  final Icon highlightIcon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onRetry;

  const EmptyStateWidget({
    super.key,
    required this.onRetry,
    required this.highlightIcon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingSize.lg,
          vertical: SpacingSize.xl,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Container(
            padding: const EdgeInsets.all(SpacingSize.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  "assets/lottie/empty_v2.json",
                  width: 200.w,
                  height: 200.h,
                ),
                // const SizedBox(height: SpacingSize.lg),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpacingSize.md,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: context.primaryColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'Nenhum resultado',
                    style: context.appText.bodySmall.copyWith(
                      color: context.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: SpacingSize.lg),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: context.appText.headermd.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: SpacingSize.sm),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: context.appText.bodySmall.copyWith(
                    color: context.secondaryColor,
                    fontWeight: FontWeight.w500,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: SpacingSize.xl),
                SizedBox(
                  width: double.infinity,
                  child: ButtonPrimary(
                    // bgColor: context.primaryColor,
                    // textColor: Colors.white,
                    press: onRetry,
                    text: buttonText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
