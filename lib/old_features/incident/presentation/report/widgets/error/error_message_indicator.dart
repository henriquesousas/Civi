import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ErrorMessageIndicator extends StatelessWidget {
  final String? error;
  final int errorCode;
  const ErrorMessageIndicator(
      {super.key, required this.error, required this.errorCode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        _getErrorMessage(),
        textAlign: TextAlign.center,
        style: context.appTextStyles.bodyTextStyle1.copyWith(
          color: Colors.white.withValues(alpha: 0.95),
          height: 1.6,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _getErrorMessage() {
    if (error != null) {
      return error!;
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
}
