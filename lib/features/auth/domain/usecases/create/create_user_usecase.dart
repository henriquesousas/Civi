import 'package:dartz/dartz.dart';
import 'package:yousafe/core/domain/exception/validation_exception.dart';
import 'package:yousafe/core/domain/extension/enum_extension.dart';
import 'package:yousafe/core/domain/type/result.dart';
import 'package:yousafe/core/domain/use_case.dart';
import 'package:yousafe/features/auth/domain/entity/user.dart';
import 'package:yousafe/features/auth/domain/gender.dart';
import 'package:yousafe/features/auth/domain/usecases/create/create_use_dto.dart';
import 'package:yousafe/features/auth/domain/user_builder.dart';
import 'package:yousafe/features/auth/domain/user_repository.dart';

class CreateUserUsecase extends UseCase<CreateUseDto, EitherResult<User>> {
  final UserRepository repository;

  CreateUserUsecase({required this.repository});

  @override
  EitherResult<User> execute(CreateUseDto dto) {
    final user = UserBuilder(
      name: dto.name,
      surName: dto.surname,
      email: dto.email,
      phone: dto.phone,
      password: dto.password,
      gender: dto.gender.toEnum(Gender.values),
    ).build();

    if (user.notification.hasErrors) {
      return left(ValidationException(errors: user.notification.getErrors));
    }

    repository.save(user);
    return right(user);
  }
}
