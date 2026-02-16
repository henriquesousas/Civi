import 'package:deehelp/module/auth/external/di/auth_usecase_provider.dart';
import 'package:deehelp/feature/auth/viemodel/auth_view_model.dart';
import 'package:deehelp/feature/auth/viemodel/auth_state.dart';
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
