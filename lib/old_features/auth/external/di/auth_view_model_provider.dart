import 'package:deehelp/old_features/auth/external/di/auth_usecase_provider.dart';
import 'package:deehelp/old_features/auth/presentation/auth/auth_view_model.dart';
import 'package:deehelp/old_features/auth/presentation/auth/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) {
    final signInUseCase = ref.watch(signInWithGoogleUseCaseProvider);
    final signOutUsecase = ref.watch(signOutUseCaseProvider);
    return AuthViewModel(
      signInWithGoogleUseCase: signInUseCase,
      signOutUsecase: signOutUsecase,
    );
  },
);
