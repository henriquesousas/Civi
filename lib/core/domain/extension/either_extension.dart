import 'package:dartz/dartz.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  R? get successOrNull => fold((_) => null, (right) => right);

  L? get errorOrNull => fold((left) => left, (_) => null);

  R getOrThrow() => fold(
        (left) => throw left is Exception ? left : Exception(left.toString()),
        (right) => right,
      );
}

extension FutureEitherExtension<L, R> on Future<Either<L, R>> {
  Future<Either<L, R2>> flatMapAsync<R2>(
      Future<Either<L, R2>> Function(R) f) async {
    final either = await this;
    return either.fold(
      (left) => Left(left),
      (right) async => await f(right),
    );
  }
}
