import 'package:deehelp/core/errors/failure.dart';
import 'package:deehelp/core/utils/result.dart';

class HandleCommand {
  /// Helper genérico para executar comandos em StateNotifiers
  /// Recebe callbacks para atualizar o estado
  ///
  ///T é a resposta com command
  ///
  ///State representa o state do provider
  static Future<void> execute<T, State>({
    required void Function(State newState) updateState,
    required Future<Result<T>> Function() command,
    required State Function() onLoading,
    required State Function(T result) onSuccess,
    required State Function(Failure) onError,
    String unexpectedErrorMessage = "Error inesperado",
  }) async {
    try {
      // 1. Loading
      updateState(onLoading());

      // 2. Executa comando
      final result = await command();

      // 3. Processa resultado
      result.when(
        success: (data) => updateState(onSuccess(data)),
        failure: (error) => updateState(onError(error)),
      );
    } catch (e) {
      updateState(onError(const DefaultFailure()));
    }
  }
}
