import 'package:dartz/dartz.dart';

import '../exception/app_exception.dart';

/// Type alias para reduzir boilerplate
typedef EitherResult<T> = Either<AppException, T>;
typedef FutureEitherResult<T> = Future<Either<AppException, T>>;
