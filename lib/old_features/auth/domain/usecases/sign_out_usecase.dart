import 'package:deehelp/old_core/base/use_case.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_features/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase implements UseCaseWithoutParam<Unit> {
  final AuthRepository _repository;

  SignOutUsecase({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute() async {
    return await _repository.signOut();
  }
}
