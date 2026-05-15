import 'package:deehelp/business/auth/di/auth_repository_provider.dart';
import 'package:deehelp/business/auth/di/google_auth_service_provider.dart';
import 'package:deehelp/module/auth/domain/usecases/sign_out_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/sign_in_with_google_usecase.dart';

final signInWithGoogleUseCaseProvider =
    Provider<SignInWithGoogleUseCase>((ref) {
  final googleAuthentication = ref.watch(googleAuthServiceProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInWithGoogleUseCase(
    googleAuthService: googleAuthentication,
    authRepository: authRepository,
  );
});

//TODO: Remover
final signOutUseCaseProvider = Provider<SignOutUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignOutUsecase(repository: authRepository);
  // throw UnimplementedError();
});
