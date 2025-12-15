import 'package:deehelp/core/domain/type/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCommandWrapper {
  ///
  /// Use [T] as Result of service/usecase.
  ///
  /// Use [State] as State of bloc
  ///
  /// UseCase must return a [T].
  static Future<void> execute<T extends Object, State>({
    required State currentState,
    required Emitter<State> emit,
    required Future<EitherResult<T>> Function() command,
    required State Function(State currentState) onLoading,
    required State Function(State currentState, T result) onSuccess,
    required State Function(State currentState, Exception error) onError,
  }) async {
    try {
      // Emit loading state
      emit(onLoading(currentState));
      // Execute the use case and handle the result
      final result = await command();
      result.fold(
        (error) => emit(onError(currentState, error)),
        (success) => emit(onSuccess(currentState, success)),
      );
    } catch (e) {
      emit(onError(currentState, e as Exception));
    }
  }
}
