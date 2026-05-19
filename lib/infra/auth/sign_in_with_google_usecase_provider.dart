import 'package:deehelp/infra/auth/repositories/auth_repository_provider.dart';
import 'package:deehelp/infra/auth/services/google_auth_service_provider.dart';
import 'package:deehelp/business/auth/sign_in_with_google_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_with_google_usecase_provider.g.dart';

@riverpod
SignInWithGoogleUseCase signInWithGoogleUseCase(Ref ref) {
  return SignInWithGoogleUseCase(
    googleAuthService: ref.read(googleAuthServiceProvider),
    authRepository: ref.read(authRepositoryProvider),
  );
}
