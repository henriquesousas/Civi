import 'package:deehelp/business/auth/domain/sign_in_with_google_usecase.dart';
import 'package:deehelp/module/auth/domain/usecases/sign_out_usecase.dart';
import 'package:deehelp/ui/auth/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  AuthNotifier({
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required SignOutUsecase signOutUsecase,
  })  : _signInWithGoogleUseCase = signInWithGoogleUseCase,
        super(const AuthState.initial());

  Future<void> signInWithGoogle() async {
    state = const AuthState.loading();
    final result = await _signInWithGoogleUseCase.execute().run();
    state = result.fold(
      (failure) => AuthState.error(failure.message, failure.type),
      (loggedUser) => AuthState.authenticated(loggedUser),
    );
  }

  void continueWithoutAccount() {
    // state = const AuthState.loadingAuthWithoutAccount();
    // final authenticatedUser = LoggedUser.unauthenticated();
    // state = AuthState.authenticated(authenticatedUser);
  }

  void signOut() async {
    // await _signOutUsecase.execute();
  }
}
