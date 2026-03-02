import '../../core/errors/failure.dart';

sealed class Result<T> {
  const Result();

  factory Result.success(T value) = Success<T>;
  factory Result.failure(Failure failure) = FailureResult<T>;

  // Método when para pattern matching
  R when<R>({
    required R Function(T value) success,
    required R Function(Failure failureValue) failure,
  }) {
    return switch (this) {
      Success(:final value) => success(value),
      FailureResult(:final failureValue) => failure(failureValue),
    };
  }

  // Método whenOrNull (opcional)
  R? whenOrNull<R>({
    R Function(T value)? success,
    R Function(Failure failureValue)? failure,
  }) {
    return switch (this) {
      Success(:final value) => success?.call(value),
      FailureResult(:final failureValue) => failure?.call(failureValue),
    };
  }
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class FailureResult<T> extends Result<T> {
  final Failure failureValue;
  const FailureResult(this.failureValue);
}
