import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:deehelp/infra/auth/providers/sign_in_with_google_usecase_provider.dart';
import 'package:deehelp/business/auth/sign_in_with_google_usecase.dart';
import 'package:deehelp/ui/auth/auth_state.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  @override
  AuthState build() {
    _signInWithGoogleUseCase = ref.read(signInWithGoogleUseCaseProvider);
    return const AuthState.initial();
  }

  Future<void> signInWithGoogle() async {
    state = const AuthState.loading();
    final result = await _signInWithGoogleUseCase.execute().run();
    state = result.fold(
      (failure) => AuthState.error(failure.message, failure.type),
      (loggedUser) => AuthState.authenticated(loggedUser),
    );
  }
}

// class OldAuthNotifier extends StateNotifier<AuthState> {
//   final SignInWithGoogleUseCase _signInWithGoogleUseCase;

//   OldAuthNotifier({
//     required SignInWithGoogleUseCase signInWithGoogleUseCase,
//     required SignOutUsecase signOutUsecase,
//   })  : _signInWithGoogleUseCase = signInWithGoogleUseCase,
//         super(const AuthState.initial());

//   Future<void> signInWithGoogle() async {
//     state = const AuthState.loading();
//     final result = await _signInWithGoogleUseCase.execute().run();
//     state = result.fold(
//       (failure) => AuthState.error(failure.message, failure.type),
//       (loggedUser) => AuthState.authenticated(loggedUser),
//     );
//   }

//   void continueWithoutAccount() {
//     // state = const AuthState.loadingAuthWithoutAccount();
//     // final authenticatedUser = LoggedUser.unauthenticated();
//     // state = AuthState.authenticated(authenticatedUser);
//   }

//   void signOut() async {
//     // await _signOutUsecase.execute();
//   }
// }
