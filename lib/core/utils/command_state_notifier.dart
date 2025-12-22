import 'package:deehelp/core/utils/result.dart';

class CommandStateNotifier {
  /// Helper genérico para executar comandos em StateNotifiers
  /// Recebe callbacks para atualizar o estado
  static Future<void> execute<T, State>({
    required void Function(State newState) updateState,
    required Future<Result<T>> Function() command,
    required State Function() onLoading,
    required State Function(T result) onSuccess,
    required State Function(String error) onError,
    String unexpectedErrorMessage = "Erro inesperado",
  }) async {
    try {
      // 1. Loading
      updateState(onLoading());

      // 2. Executa comando
      final result = await command();

      // 3. Processa resultado
      result.when(
        success: (data) => updateState(onSuccess(data)),
        failure: (error) => updateState(onError(error.message)),
      );
    } catch (e) {
      updateState(onError("$unexpectedErrorMessage: ${e.toString()}"));
    }
  }
}
