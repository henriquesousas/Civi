import 'package:deehelp/old_core/handlers/handle_command.dart';
import 'package:deehelp/old_core/handlers/handler_error.dart';
import 'package:deehelp/module/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/module/auth/domain/services/operation_status.dart';
import 'package:deehelp/module/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:deehelp/module/auth/domain/usecases/sign_out_usecase.dart';
import 'package:deehelp/feature/auth/viemodel/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignOutUsecase _signOutUsecase;

  AuthViewModel({
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required SignOutUsecase signOutUsecase,
  })  : _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _signOutUsecase = signOutUsecase,
        super(const AuthState.initial());

  void signInWithGoogle() async {
    HandleCommand.execute<AuthenticatedUser, AuthState>(
      updateState: (newState) => state = newState,
      command: () async => await _signInWithGoogleUseCase.execute(),
      onLoading: () => const AuthState.loading(),
      onSuccess: (authenticatedUser) =>
          AuthState.authenticated(authenticatedUser),
      onError: (error) {
        return handleError<AuthState>(
          error,
          (message, extra) {
            final status =
                extra is OperationStatus ? extra : OperationStatus.failure;
            return AuthState.error(message, status);
          },
        );
      },
    );
  }

  void continueWithoutAccount() {
    state = const AuthState.loadingAuthWithoutAccount();
    final authenticatedUser = AuthenticatedUser.unauthenticated();
    state = AuthState.authenticated(authenticatedUser);
  }

  void signOut() async {
    await _signOutUsecase.execute();
  }
}
