import 'package:deehelp/core/utils/command_state_notifier.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/domain/services/operation_status.dart';
import 'package:deehelp/features/auth/domain/usecases/get_authenticated_user_usecase.dart';
import 'package:deehelp/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:deehelp/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:deehelp/features/auth/presentation/auth/state/auth_state.dart';
import 'package:deehelp/features/auth/presentation/session/session_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/handler_error.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignOutUsecase _signOutUsecase;
  final GetAuthenticatedUserUsecase _getAuthenticatedUserUsecase;
  final SessionNotifier _sessionNotifier;

  AuthViewModel({
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required SignOutUsecase signOutUsecase,
    required GetAuthenticatedUserUsecase getAuthenticatedUserUsecase,
    required SessionNotifier sessionNotifier,
  })  : _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _signOutUsecase = signOutUsecase,
        _getAuthenticatedUserUsecase = getAuthenticatedUserUsecase,
        _sessionNotifier = sessionNotifier,
        super(const AuthState.initial());

  void signInWithGoogle() async {
    CommandStateNotifier.execute<AuthenticatedUser, AuthState>(
      updateState: (newState) => state = newState,
      command: () async => await _signInWithGoogleUseCase.execute(),
      onLoading: () => const AuthState.loading(),
      onSuccess: (authenticatedUser) {
        _sessionNotifier.setSession(authenticatedUser);
        return AuthState.authenticated(authenticatedUser);
      },
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
    _sessionNotifier.setSession(authenticatedUser);
    state = AuthState.authenticated(authenticatedUser);
  }

  void signOut() {
    throw UnimplementedError("not implemented");
  }

  void getAuthenticatedUser() async {
    try {
      final getAuthenticatedUserResult =
          await _getAuthenticatedUserUsecase.execute();
      getAuthenticatedUserResult.when(
        success: (user) async {
          _sessionNotifier.setSession(user);
          state = AuthState.authenticated(user);
        },
        failure: (error) => state = const AuthState.unauthenticated(),
      );
    } catch (e) {
      state = AuthState.error(e.toString(), OperationStatus.failure);
      return;
    }
  }
}
