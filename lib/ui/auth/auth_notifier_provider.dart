import 'package:deehelp/business/auth/di/sign_in_with_google_usecase_provider.dart';
import 'package:deehelp/ui/auth/auth_notifier.dart';
import 'package:deehelp/ui/auth/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final signInUseCase = ref.watch(signInWithGoogleUseCaseProvider);
    final signOutUsecase = ref.watch(signOutUseCaseProvider);
    return AuthNotifier(
      signInWithGoogleUseCase: signInUseCase,
      signOutUsecase: signOutUsecase,
    );
  },
);
