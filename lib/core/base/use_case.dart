import 'package:deehelp/core/utils/result.dart';

abstract class UseCase<IN, OUT> {
  Future<Result<OUT>> execute(IN data);
}

abstract class UseCaseWithoutParam<OUT> {
  Future<Result<OUT>> execute();
}
