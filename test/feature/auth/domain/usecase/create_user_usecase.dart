import 'package:deehelp/core/domain/exception/validation_exception.dart';
import 'package:deehelp/core/domain/extension/either_extension.dart';
import 'package:deehelp/features/auth/domain/auth_repository.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';
import 'package:deehelp/features/auth/domain/usecases/create/create_use_dto.dart';
import 'package:deehelp/features/auth/domain/usecases/create/create_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements AuthRepository {}

class UserFake extends Fake implements User {}

void main() {
  late CreateUserUsecase sut;
  late AuthRepository repository;

  setUpAll(() {
    registerFallbackValue(UserFake());
    repository = UserRepositoryMock();
    sut = CreateUserUsecase(repository: repository);
  });

  test("givenACorrectDto_whenCallSave_shouldReturnUser", () async {
    final dto = CreateUseDto(
      name: "any",
      surname: "any",
      email: "any@mail.com",
      password: "any",
      phone: "11995412245",
      gender: "male",
    );

    final result = await sut.execute(dto);

    expect(result.isRight(), isTrue);
    verify(() => repository.save(any())).called(1);
  });

  test("givenAInvalidDto_whenCallSave_shouldReturnError", () async {
    final dto = CreateUseDto(
      name: "a",
      surname: "a",
      email: "any",
      password: "a",
      phone: "121212",
      gender: "any",
    );

    final result = await sut.execute(dto);

    final exception = result.errorOrNull as ValidationException;

    expect(result.isLeft(), isTrue);
    expect(result.isRight(), isFalse);
    expect(exception, isNotNull);
    expect(exception.errors.length, equals(6));
    verifyNever(() => repository.save(any()));
  });
}
