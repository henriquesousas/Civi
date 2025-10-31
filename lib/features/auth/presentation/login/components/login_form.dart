import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/core/ui/dialog/dialog_extension.dart';
import 'package:deehelp/features/auth/presentation/login/components/login_or.dart';
import 'package:deehelp/shared/components/buttons/primary_button.dart';
import 'package:deehelp/shared/components/inputs/primary_text_field.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/auth_state.dart';
import '../bloc/email_state.dart';
import '../bloc/login_bloc.dart';
import '../bloc/password_state.dart';
import '../login_action.dart';
import 'login_google_button.dart';

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
          context.showDialogWarning(
            "Aviso",
            state.errorMessage ?? '',
          );
        }
      },
      builder: (context, state) {
        return Column(
          spacing: 12,
          children: [
            // Email Field
            Selector<LoginBloc, EmailState>(
              selector: (_, bloc) => state.email,
              builder: (context, emailState, child) {
                final hasError = emailState.error != null;
                final iconColor =
                    hasError ? AppColors.error : AppColors.textSecondary;

                return PrimaryTextField(
                  labelText: context.strings.labelTextEmail,
                  hintText: context.strings.hintEmail,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: iconColor,
                    size: 20,
                  ),
                  errorText: state.email.error,
                  onChanged: (value) => loginActions.onEmailChange(value),
                );
              },
            ),
            //  Password Field
            Selector<LoginBloc, PasswordState>(
              selector: (_, bloc) => bloc.state.password,
              builder: (context, passwordState, child) {
                final hasError = passwordState.error != null;
                final iconColor =
                    hasError ? AppColors.error : AppColors.textSecondary;
                final suffixIcon = state.password.obscureText
                    ? Icons.visibility_off
                    : Icons.visibility;

                return PrimaryTextField(
                  labelText: context.strings.labelTextPassword,
                  hintText: context.strings.hintPassword,
                  obscureText: state.password.obscureText,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: iconColor,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        loginActions.togglePasswordVisibility(state.password),
                    icon: Icon(suffixIcon, color: iconColor, size: 20),
                  ),
                  errorText: state.password.error,
                  onChanged: (value) => loginActions.onPasswordChange(value),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  context.strings.forgotPassword,
                  style: context.getTextStyle.regular.copyWith(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            PrimaryButton(
              text: context.strings.buttonEnter,
              // onPressed:
              //     state.isFormValid ? () => loginActions.submitLogin : null,
              onPressed: state.isFormValid
                  ? () => loginActions.submitLogin(state)
                  : null,
            ),
            const LoginOr(),
            const LoginGoogleButton(),
          ],
        );
      },
    );
  }
}
