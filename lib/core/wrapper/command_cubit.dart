import 'package:deehelp/core/domain/exception/app_exception.dart';

import '../domain/type/result.dart';

class CommandCubit {
  ///
  /// Use [T] as Result of service/usecase.
  ///
  /// Use [State] as State of bloc
  ///
  /// UseCase must return a [T].
  static Future<void> execute<T extends Object, State>({
    required void Function(State) emit,
    required Future<EitherResult<T>> Function() command,
    State Function()? onLoading,
    required State Function(T result) onSuccess,
    required State Function(AppException error) onError,
  }) async {
    try {
      if (onLoading != null) {
        emit(onLoading());
      }
      final result = await command();
      result.fold(
        (error) => emit(onError(error)),
        (success) => emit(onSuccess(success)),
      );
    } catch (e) {
      emit(onError(AppException(message: "Erro desconhecido")));
    }
  }
}
