import 'package:deehelp/features/auth/presentation/auth/providers/auth_usecase_provider.dart';
import 'package:deehelp/features/auth/presentation/auth/state/auth_state.dart';
import 'package:deehelp/features/auth/presentation/session/session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_view_model.dart';

final authViewViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) {
    final userSession = ref.watch(userSessionProvider.notifier);
    final signInUseCase = ref.watch(signInWithGoogleUseCaseProvider);
    final getAuthenticatedUserUsecase =
        ref.watch(getAuthenticatedUserUsecaseProvider);
    final signOutUsecase = ref.watch(signOutUseCaseProvider);
    return AuthViewModel(
      signInWithGoogleUseCase: signInUseCase,
      getAuthenticatedUserUsecase: getAuthenticatedUserUsecase,
      signOutUsecase: signOutUsecase,
      sessionNotifier: userSession,
    );
  },
);
