import 'package:deehelp/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';
import 'bloc/password_state.dart';

class LoginActions {
  final BuildContext context;

  LoginActions(this.context);

  void togglePasswordVisibility(PasswordState state) {
    context.read<LoginBloc>().add(
          PasswordChangedObscureTextEvent(
            obscureText: !state.obscureText,
          ),
        );
  }

  void onEmailChange(String email) {
    context.read<LoginBloc>().add(
          EmailChangedEvent(email: email),
        );
  }

  void onPasswordChange(String password) {
    context.read<LoginBloc>().add(
          PasswordChangedEvent(
            password: password,
          ),
        );
  }

  void submitLogin(AuthState state) {
    context.read<LoginBloc>().add(
          LoginWithEmailAndPasswordEvent(
            email: state.email.value,
            password: state.password.value ?? '',
          ),
        );
  }

  void submitLoginWithGoogle(AuthState state) {
    context.read<LoginBloc>().add(
          LoginWithGoogleEvent(),
        );
  }
}
