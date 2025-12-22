import 'package:deehelp/core/utils/command_state_notifier.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/domain/usecases/get_authenticated_user_usecase.dart';
import 'package:deehelp/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:deehelp/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:deehelp/features/auth/presentation/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignOutUsecase _signOutUsecase;
  final GetAuthenticatedUserUsecase _getAuthenticatedUserUsecase;

  AuthViewModel({
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required SignOutUsecase signOutUsecase,
    required GetAuthenticatedUserUsecase getAuthenticatedUserUsecase,
  })  : _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _signOutUsecase = signOutUsecase,
        _getAuthenticatedUserUsecase = getAuthenticatedUserUsecase,
        super(const AuthState.initial());

  void signInWithGoogle() async {
    CommandStateNotifier.execute<AuthenticatedUser, AuthState>(
      updateState: (newState) => state = newState,
      command: () async => await _signInWithGoogleUseCase.execute(),
      onLoading: () => const AuthState.loading(),
      onSuccess: (session) => const AuthState.authenticated(),
      onError: (error) => AuthState.error(error),
    );
  }

  void signOut() {}

  void getAuthenticatedUser() {}
}
