import 'package:dartz/dartz.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  R? get successOrNull => fold((_) => null, (right) => right);

  L? get errorOrNull => fold((left) => left, (_) => null);

  R getOrThrow() => fold(
        (left) => throw left is Exception ? left : Exception(left.toString()),
        (right) => right,
      );
}
