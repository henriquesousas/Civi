import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/features/auth/domain/auth_exception.dart';
import 'package:deehelp/features/auth/domain/auth_repository.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';
import 'package:deehelp/features/auth/domain/usecases/login/login_dto.dart';

class LoginWithEmailAndPasswordUsecase extends UseCase<LoginDto, User> {
  final AuthRepository repository;

  LoginWithEmailAndPasswordUsecase({required this.repository});

  @override
  Future<EitherResult<User>> execute(LoginDto dto) async {
    //TODO: not in use
    throw UnimplementedError();
    final authResult = await repository.login(dto.email, dto.password);

    return authResult.success
        ? right(authResult.user!)
        : left(AuthException.fromResult(authResult));
  }
}
