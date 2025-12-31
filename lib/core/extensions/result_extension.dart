// lib/core/extensions/result_extensions.dart
import 'package:deehelp/core/errors/failure.dart';
import 'package:deehelp/core/utils/result.dart';

extension ResultExtensions<T> on Result<T> {
  /// Transforma um Result<T> em Result<U> quando é sucesso
  Future<Result<U>> flatMap<U>(
    Future<Result<U>> Function(T value) mapper,
  ) async {
    return when(
      success: (value) async => await mapper(value),
      failure: (failure) => Result.failure(failure),
    );
  }

  /// Encadeia uma ação que retorna outro Result<T>
  Future<Result<T>> then(
    Future<Result<T>> Function(T value) action,
  ) async {
    return when(
      success: (value) async => await action(value),
      failure: (failure) => Result.failure(failure),
    );
  }

  /// Executa ação apenas no sucesso (para side effects)
  Future<Result<T>> tap(
    Future<void> Function(T value) action,
  ) async {
    return when(
      success: (value) async {
        await action(value);
        return Result.success(value);
      },
      failure: (failure) => Result.failure(failure),
    );
  }

  T? get data => when(success: (value) => value, failure: (_) => null);
  Object? get error => when(success: (_) => null, failure: (err) => err);
  bool get isSuccess => data != null;
  bool get isFailure => error != null;

  /// Mapeia o valor de sucesso sem mudar o tipo Result
  // Future<Result<U>> map<U>(
  //   Future<U> Function(T value) mapper,
  // ) async {
  //   return when(
  //     success: (value) async {
  //       try {
  //         final result = await mapper(value);
  //         return Result.success(result);
  //       } catch (e) {
  //         return Result.failure(Failure(message: e.toString()));
  //       }
  //     },
  //     failure: (failure) => Result.failure(failure),
  //   );
  // }
}

extension FutureResultExtensions<T> on Future<Result<T>> {
  Future<Result<U>> flatMap<U>(
    Future<Result<U>> Function(T value) mapper,
  ) async {
    final result = await this;
    return result.flatMap(mapper);
  }

  Future<Result<U>> map<U>(
    Future<U> Function(T value) mapper,
  ) async {
    final result = await this;
    return result.when(
      success: (value) async {
        try {
          final result = await mapper(value);
          return Result.success(result);
        } catch (e) {
          // return Result.failure(Failure(message: e.toString()));
          return Result.failure(CacheFailure(""));
        }
      },
      failure: (f) => Result.failure(f),
    );
  }
}
