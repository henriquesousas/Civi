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
    required State Function() onLoading,
    required State Function(T result) onSuccess,
    required State Function(Exception error) onError,
  }) async {
    try {
      emit(onLoading());
      final result = await command();
      result.fold(
        (error) => emit(onError(error)),
        (success) => emit(onSuccess(success)),
      );
    } catch (e) {
      emit(onError(e is Exception ? e : Exception(e.toString())));
    }
  }
}
