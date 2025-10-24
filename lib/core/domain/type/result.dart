import 'package:dartz/dartz.dart';

import '../exception/domain_exception.dart';

/// Type alias para reduzir boilerplate
typedef EitherResult<T> = Either<DomainException, T>;
typedef FutureEitherResult<T> = Future<Either<DomainException, T>>;
