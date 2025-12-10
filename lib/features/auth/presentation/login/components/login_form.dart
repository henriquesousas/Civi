import 'package:deehelp/core/components/buttons/ui_google_button.dart';
import 'package:deehelp/core/components/buttons/ui_primary_button.dart';
import 'package:deehelp/core/components/textfields/ui_email_text_field.dart';
import 'package:deehelp/core/components/textfields/ui_password_text_field.dart';
import 'package:deehelp/features/auth/presentation/login/components/login_or.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/ui/localization/resources.dart';
import '../bloc/auth_state.dart';
import '../bloc/email_state.dart';
import '../bloc/login_bloc.dart';
import '../bloc/password_state.dart';
import '../login_action.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final LoginActions loginActions;

  @override
  void initState() {
    super.initState();
    loginActions = LoginActions(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.error) {
          // context.showDialogWarning(
          //   R.strings.warning,
          //   state.errorMessage ?? '',
          // );
        }

        if (state.status == AuthStatus.success) {
          // context.showDialogWarning(
          //   "Sucesso",
          //   'Login realizado com sucesso',
          // );
        }
      },
      builder: (context, state) {
        return Column(
          spacing: 12,
          children: [
            Selector<LoginBloc, EmailState>(
              selector: (_, bloc) => state.email,
              builder: (context, emailState, child) {
                return UIEmailTextField(
                  errorText: state.email.error,
                  onChanged: (value) => loginActions.onEmailChange(value),
                );
              },
            ),
            Selector<LoginBloc, PasswordState>(
              selector: (_, bloc) => bloc.state.password,
              builder: (context, passwordState, child) {
                return UIPasswordTextField(
                    obscureText: state.password.obscureText,
                    errorText: state.password.error,
                    onChanged: (value) => loginActions.onPasswordChange(value));
              },
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text("Esqueceu senha"),
              ),
            ),
            UIPrimaryButton(
                text: "Entrar",
                press: () => state.isFormValid
                    ? () => loginActions.submitLogin(state)
                    : null),
            const LoginOr(),
            UIGoogleButton(
                press: () => loginActions.submitLoginWithGoogle(state))
          ],
        );
      },
    );
  }
}
