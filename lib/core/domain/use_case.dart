import 'package:deehelp/core/domain/type/result.dart';

abstract class UseCase<IN, OUT> {
  Future<EitherResult<OUT>> execute(IN data);
}

abstract class UseCaseWithParameter<OUT> {
  Future<EitherResult<OUT>> execute();
}
