import 'package:deehelp/business/_shared/failures/failure.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/business/auth/domain/auth_repository.dart';
import 'package:fpdart/src/task_either.dart';

class SignOutUsecase implements OLDUseCaseWithoutParam<Unit> {
  final AuthRepository _repository;

  SignOutUsecase({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute() async {
    // return await _repository.signOut();
    throw UnimplementedError();
  }
}
