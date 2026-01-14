import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/features/incident/presentation/views/add/widgets/error/error_indicator_solutions.dart';
import 'package:deehelp/features/incident/presentation/views/add/widgets/error/error_indicator_widget.dart';
import 'package:deehelp/features/incident/presentation/views/add/widgets/error/error_message_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class IncidentErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String? errorMessage;
  final int errorCode;

  const IncidentErrorWidget({
    Key? key,
    required this.onRetry,
    this.errorMessage,
    this.errorCode = 0,
  }) : super(key: key);

  String _getErrorTitle() {
    switch (errorCode) {
      case 1:
        return 'SEM CONEXÃO';
      case 2:
        return 'SERVIDOR INDISPONÍVEL';
      case 3:
        return 'TEMPO ESGOTADO';
      default:
        return 'FALHA NO ENVIO';
    }
  }

  String _getErrorMessage() {
    if (errorMessage != null) {
      return errorMessage!;
    }

    switch (errorCode) {
      case 1:
        return 'Verifique sua conexão com a internet e tente novamente.';
      case 2:
        return 'O servidor está temporariamente indisponível. Tente novamente em alguns instantes.';
      case 3:
        return 'A operação levou mais tempo que o esperado. Verifique sua conexão.';
      default:
        return 'Não foi possível enviar seu alerta para a comunidade.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB71C1C),
      body: SafeArea(
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
              ErrorIndicatorWidget(error: _getErrorTitle()),
              const SizedBox(height: Dimens.size20),
              ErrorMessageIndicator(error: _getErrorMessage()),
              const ErrorIndicatorSolutions(),
              // _buildErrorDetailCard(),
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
                    // UIElevatedButton(
                    //   bgColor: Colors.transparent,
                    //   borderColor: AppColors.errorColor,
                    //   textStyle: context.appTextStyles.sectionTitle.copyWith(
                    //     color: AppColors.whiteColor,
                    //   ),
                    //   text: "VOLTAR",
                    //   press: () => context.pop(),
                    // ),
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

/**
 * Widget _buildErrorDetailCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline,
                  color: Colors.white.withOpacity(0.8), size: 20),
              const SizedBox(width: 8),
              Text(
                'DETALHES DO ERRO',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Código: ERR-${widget.errorCode.toString().padLeft(3, '0')}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (_retryCount > 0) ...[
            const SizedBox(height: 4),
            Text(
              'Tentativas: $_retryCount',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 13,
              ),
            ),
          ],
        ],
      ),
    );
  }
 */
