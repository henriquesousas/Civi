import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/exception/validation_exception.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/features/auth/domain/auth_exception.dart';
import 'package:deehelp/features/auth/domain/auth_repository.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';
import 'package:deehelp/features/auth/domain/usecases/create/create_use_dto.dart';
import 'package:deehelp/features/auth/domain/user_builder.dart';

class CreateUserUsecase extends UseCase<CreateUseDto, User> {
  final AuthRepository repository;

  CreateUserUsecase({required this.repository});

  @override
  Future<EitherResult<User>> execute(CreateUseDto data) async {
    final user = UserBuilder(
      name: data.name,
      email: data.email,
    ).build();

    if (user.notification.hasErrors) {
      return left(ValidationException(errors: user.notification.getErrors));
    }

    final authResult = await repository.save(user);

    return authResult.success
        ? right(user)
        : left(AuthException.fromResult(authResult));
  }
}
