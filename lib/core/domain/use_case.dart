import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/utils/result.dart';

// abstract class OldUseCase<IN, OUT> {
//   Future<EitherResult<OUT>> execute(IN data);
// }

// abstract class OldUseCaseWithParameter<OUT> {
//   Future<EitherResult<OUT>> execute();
// }

abstract class UseCase<IN, OUT> {
  Future<Result<OUT>> execute(IN data);
}

abstract class UseCaseWithoutParam<OUT> {
  Future<Result<OUT>> execute();
}
