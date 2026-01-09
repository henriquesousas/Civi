import 'package:deehelp/features/auth/external/di/google_auth_service_provider.dart';
import 'package:deehelp/features/auth/external/di/auth_repository_provider.dart';
import 'package:deehelp/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/sign_in_with_google_usecase.dart';

final signInWithGoogleUseCaseProvider =
    Provider<SignInWithGoogleUseCase>((ref) {
  final googleAuthentication = ref.watch(googleAuthenticationProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInWithGoogleUseCase(
    googleAuthService: googleAuthentication,
    authRepository: authRepository,
  );
});

final signOutUseCaseProvider = Provider<SignOutUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignOutUsecase(repository: authRepository);
});
