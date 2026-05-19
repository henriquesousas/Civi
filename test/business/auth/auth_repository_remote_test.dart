import 'package:deehelp/business/auth/auth_datasource.dart';
import 'package:deehelp/core/failures/invalid_credentials_failure.dart';
import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:deehelp/infra/auth/repositories/auth_repository_remote.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthDatasource extends Mock implements AuthDataSource {}

void main() {
  late MockAuthDatasource mockAuthDatasource;
  late AuthRepositoryRemote sut;

  setUp(() {
    mockAuthDatasource = MockAuthDatasource();
    sut = AuthRepositoryRemote(datasource: mockAuthDatasource);
  });

  test("givenAValidGoogleCredential_WhenSigningIn_ShouldReturnLoggedUser",
      () async {
    final expectedIdToken = "any_idToken";
    final expectedAccessToken = "any_accessToken";
    final expectedLogguedUser = LogguedUser(
      id: "any_id",
      name: "any_name",
      email: "any_email",
    );

    when(() => mockAuthDatasource.signInWithGoogle(any(), any())).thenAnswer(
      (_) async => expectedLogguedUser,
    );

    final res =
        await sut.signInWithGoogle(expectedIdToken, expectedAccessToken).run();

    expect(res, right(expectedLogguedUser));
    verify(() => mockAuthDatasource.signInWithGoogle(
        expectedIdToken, expectedAccessToken)).called(1);
  });

  test("givenAInValidGoogleCredential_WhenSigningIn_ShouldReturnFailure",
      () async {
    final expectedIdToken = "any_idToken";
    final expectedAccessToken = "any_accessToken";
    final expectedFailure = const InvalidCredentialsFailure();

    when(() => mockAuthDatasource.signInWithGoogle(any(), any())).thenAnswer(
      (_) async => throw const InvalidCredentialsFailure(),
    );

    final res =
        await sut.signInWithGoogle(expectedIdToken, expectedAccessToken).run();

    expect(res, left(expectedFailure));
    verify(() => mockAuthDatasource.signInWithGoogle(
          expectedIdToken,
          expectedAccessToken,
        )).called(1);
  });
}
