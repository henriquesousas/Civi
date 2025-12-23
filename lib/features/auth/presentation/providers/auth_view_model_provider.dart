import 'package:deehelp/features/auth/presentation/providers/auth_usecase_provider.dart';
import 'package:deehelp/features/auth/presentation/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/auth_view_model.dart';

final authViewViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) {
    final signInUseCase = ref.watch(signInWithGoogleUseCaseProvider);
    final getAuthenticatedUserUsecase =
        ref.watch(getAuthenticatedUserUsecaseProvider);
    final signOutUsecase = ref.watch(signOutUseCaseProvider);
    return AuthViewModel(
      signInWithGoogleUseCase: signInUseCase,
      getAuthenticatedUserUsecase: getAuthenticatedUserUsecase,
      signOutUsecase: signOutUsecase,
    );
  },
);
