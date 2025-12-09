import 'package:deehelp/core/services/session/user_session_service.dart';
import 'package:deehelp/core/wrapper/command_cubit.dart';
import 'package:deehelp/features/auth/domain/usecases/login/login_with_google_usecase.dart';
import 'package:deehelp/features/onboarding/page/state/onboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/domain/entity/user.dart';

class OnboardCubit extends Cubit<OnboardState> {
  final LoginWithGoogleUsecase _loginWithGoogleUsecase;
  final UserSessionService _session;

  OnboardCubit({
    required LoginWithGoogleUsecase loginWithGoogleUsecase,
    required UserSessionService session,
  })  : _loginWithGoogleUsecase = loginWithGoogleUsecase,
        _session = session,
        super(const OnboardState.initial());

  void loginWithGoogle() async {
    await CommandCubit.execute<User, OnboardState>(
      emit: emit,
      command: () => _loginWithGoogleUsecase.execute(),
      onLoading: () => const OnboardState.initial(),
      onSuccess: (result) => const OnboardState.loginSuccess(),
      onError: (error) => const OnboardState.loginError(),
    );
  }

  // OnboardState _saveSession() {
  //   // final session = UserSession(
  //   //   id: "",
  //   //   name: "",
  //   //   email: "",
  //   //   photoUrl: "",
  //   // );
  //   // final prefs = UserPreferences.from(session: session);
  //   // _prefs.savePreferences(prefs);
  //   // return OnboardState.loginSuccess();
  // }
}
