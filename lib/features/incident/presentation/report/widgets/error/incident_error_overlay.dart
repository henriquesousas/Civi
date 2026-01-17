import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/error/error_indicator_solutions.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/error/error_indicator_widget.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/error/error_message_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class IncidentErrorOverlay extends StatelessWidget {
  final VoidCallback onRetry;
  final String? errorMessage;
  final int errorCode;

  const IncidentErrorOverlay({
    Key? key,
    required this.onRetry,
    this.errorMessage,
    this.errorCode = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xFFB71C1C),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Dimens.size180.w,
                height: Dimens.size180.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Lottie.asset(
                    'assets/lottie/notification_error.json',
                    width: Dimens.defaultImageIndicator.w,
                    height: Dimens.defaultImageIndicator.h,
                    repeat: false,
                  ),
                ),
              ),
              const SizedBox(height: Dimens.size20),
              ErrorIndicatorWidget(error: errorCode),
              const SizedBox(height: Dimens.size20),
              ErrorMessageIndicator(error: errorMessage, errorCode: errorCode),
              const ErrorIndicatorSolutions(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 16,
                  children: [
                    UIElevatedButton(
                      bgColor: Colors.white,
                      textStyle: context.appTextStyles.sectionTitle.copyWith(
                        color: AppColors.errorColorDark,
                      ),
                      text: "VOLTAR",
                      press: onRetry,
                    ),
                    Text(
                      'Se o problema persistir, entre em contato com o suporte',
                      textAlign: TextAlign.center,
                      style: context.appTextStyles.sectionSubTitle1.copyWith(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
