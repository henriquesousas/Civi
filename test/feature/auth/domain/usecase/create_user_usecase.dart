import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/exception/validation_exception.dart';
import 'package:deehelp/features/auth/domain/auth_repository.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';
import 'package:deehelp/features/auth/domain/usecases/create/create_use_dto.dart';
import 'package:deehelp/features/auth/domain/usecases/create/create_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements AuthRepository {}

class UserFake extends Fake implements User {}

extension EitherExtensions<L, R> on Either<L, R> {
  R? get successOrNull => fold((_) => null, (right) => right);

  L? get errorOrNull => fold((left) => left, (_) => null);

  R getOrThrow() => fold(
        (left) => throw left is Exception ? left : Exception(left.toString()),
        (right) => right,
      );
}

void main() {
  late CreateUserUsecase sut;
  late AuthRepository repository;

  setUpAll(() {
    registerFallbackValue(UserFake());
    repository = UserRepositoryMock();
    sut = CreateUserUsecase(repository: repository);
  });

  test("givenACorrectDto_whenCallSave_shouldReturnUser", () {
    final dto = CreateUseDto(
      name: "any",
      surname: "any",
      email: "any@mail.com",
      password: "any",
      phone: "11995412245",
      gender: "male",
    );

    final result = sut.execute(dto);

    expect(result.isRight(), isTrue);
    verify(() => repository.save(any())).called(1);
  });

  test("givenAInvalidDto_whenCallSave_shouldReturnError", () {
    final dto = CreateUseDto(
      name: "a",
      surname: "a",
      email: "any",
      password: "a",
      phone: "121212",
      gender: "any",
    );

    final result = sut.execute(dto);

    final exception = result.errorOrNull as ValidationException;

    expect(result.isLeft(), isTrue);
    expect(result.isRight(), isFalse);
    expect(exception, isNotNull);
    expect(exception.errors.length, equals(6));
    verifyNever(() => repository.save(any()));
  });
}
