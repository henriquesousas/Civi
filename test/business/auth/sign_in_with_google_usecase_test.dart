import 'package:deehelp/core/failures/failure.dart';
import 'package:deehelp/core/failures/unexpected_failure.dart';
import 'package:deehelp/business/auth/auth_repository.dart';
import 'package:deehelp/core/failures/google_auth_failure.dart';
import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:deehelp/business/auth/usecases/sign_in_with_google_usecase.dart';
import 'package:deehelp/core/data/auth/google/google_auth_service.dart';
import 'package:deehelp/core/data/auth/google/google_credentials.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockGoogleAuthService extends Mock implements GoogleAuthService {}

LogguedUser makeLoggedUser() => LogguedUser(
      id: 'any_id',
      name: 'any_name',
      email: 'any_email',
    );

GoogleCredentials makeGoogleCredentials() => GoogleCredentials(
      idToken: 'any_token',
      accessToken: 'any_access_token',
    );

void main() {
  late MockAuthRepository mockRepository;
  late MockGoogleAuthService mockGoogleAuthService;
  late SignInWithGoogleUseCase sut;

  setUp(() {
    mockRepository = MockAuthRepository();
    mockGoogleAuthService = MockGoogleAuthService();
    sut = SignInWithGoogleUseCase(
      googleAuthService: mockGoogleAuthService,
      authRepository: mockRepository,
    );
  });

  test(
      "givenSignWithGoogleUseCase_whenGoogleAuthSucceeds_thenReturnsLoggedUser",
      () async {
    final expectedLogguedUser = makeLoggedUser();
    when(() => mockGoogleAuthService.auth()).thenReturn(
      TaskEither<Failure, GoogleCredentials>.right(makeGoogleCredentials()),
    );

    when(() => mockRepository.signInWithGoogle(
          any(),
          any(),
        )).thenReturn(
      TaskEither<Failure, LogguedUser>.right(expectedLogguedUser),
    );

    final res = await sut.execute().run();
    expect(res, right(expectedLogguedUser));
    verify(() => mockGoogleAuthService.auth()).called(1);
    verify(() => mockRepository.signInWithGoogle(
          makeGoogleCredentials().idToken,
          makeGoogleCredentials().accessToken,
        )).called(1);
  });

  test("givenSignWithGoogleUseCase_whenGoogleAuthFails_thenReturnsFailure",
      () async {
    final expectedFailure = const GoogleAuthFailure();
    when(() => mockGoogleAuthService.auth())
        .thenReturn(TaskEither.left(expectedFailure));

    final res = await sut.execute().run();
    expect(res, left(expectedFailure));
  });

  test("givenSignWithGoogleUseCase_whenAuthRepositoryFails_thenReturnsFailure",
      () async {
    final expectedFailure = const UnexpectedFailure();

    when(() => mockGoogleAuthService.auth()).thenReturn(
      TaskEither<Failure, GoogleCredentials>.right(makeGoogleCredentials()),
    );

    when(() => mockRepository.signInWithGoogle(
          any(),
          any(),
        )).thenReturn(TaskEither.left(expectedFailure));

    final res = await sut.execute().run();
    expect(res, left(expectedFailure));
  });
}
