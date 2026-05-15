import 'package:deehelp/business/_shared/failures/exports.dart';
import 'package:fpdart/fpdart.dart';
import 'package:deehelp/core/utils/result.dart';

abstract class UseCase<IN, OUT> {
  TaskEither<Failure, OUT> execute(IN data);
}

abstract class UseCaseWithoutParam<OUT> {
  TaskEither<Failure, OUT> execute();
}

//TODO: Remover
abstract class OLDUseCase<IN, OUT> {
  Future<Result<OUT>> execute(IN data);
}

abstract class OLDUseCaseWithoutParam<OUT> {
  Future<Result<OUT>> execute();
}
