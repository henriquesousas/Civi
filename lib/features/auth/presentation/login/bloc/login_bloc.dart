import 'package:deehelp/features/auth/domain/usecases/login/login_dto.dart';
import 'package:deehelp/features/auth/domain/usecases/login/login_with_email_and_password_usecase.dart';
import 'package:deehelp/features/auth/domain/usecases/login/login_with_google_usecase.dart';
import 'package:deehelp/features/auth/presentation/login/bloc/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/bloc_command_wrapper.dart';
import '../../../domain/auth_exception.dart';
import '../../../domain/entity/user.dart';
import 'auth_state.dart';

class LoginBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithEmailAndPasswordUsecase loginWithEmailAndPasswordUseCase;
  final LoginWithGoogleUsecase loginWithGoogleUsecase;

  LoginBloc({
    required this.loginWithEmailAndPasswordUseCase,
    required this.loginWithGoogleUsecase,
  }) : super(AuthState.initial()) {
    on<LoginWithEmailAndPasswordEvent>(loginWithEmailAndPassword);
    on<LoginWithGoogleEvent>(loginWithGoogle);
    on<EmailChangedEvent>(onEmailChange);
    on<PasswordChangedEvent>(onPasswordChange);
    on<PasswordChangedObscureTextEvent>(onChangeVisibility);
  }

  Future<void> onEmailChange(
    EmailChangedEvent event,
    Emitter<AuthState> emit,
  ) async {
    final email = event.email;
    final isValid = email.contains("@");
    final error = isValid ? null : "Error";

    final newState = state.updateEmailState(email, error);
    emit(newState);
  }

  Future<void> onPasswordChange(
    PasswordChangedEvent event,
    Emitter<AuthState> emit,
  ) async {
    final password = event.password;
    final isValid = password.length >= 6;
    final error = isValid ? null : "Senha deve ter pelo menos 6 caracteres";

    final newState = state.updatePasswordState(password, error);
    emit(newState);
  }

  Future<void> onChangeVisibility(
    PasswordChangedObscureTextEvent event,
    Emitter<AuthState> emit,
  ) async {
    final newState = state.updatePasswordVisibilityState(event.obscureText);
    emit(newState);
  }

  Future<void> loginWithEmailAndPassword(
    LoginWithEmailAndPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    final dto = LoginDto(
      email: state.email.value,
      password: state.password.value ?? '',
    );
    await BlocCommandWrapper.execute<User, AuthState>(
      currentState: state,
      emit: emit,
      command: () => loginWithEmailAndPasswordUseCase.execute(dto),
      onLoading: (currentState) =>
          currentState.copyWith(status: AuthStatus.loading),
      onSuccess: (currentState, user) =>
          currentState.copyWith(status: AuthStatus.success, user: user),
      onError: (currentState, error) => currentState.copyWith(
          status: AuthStatus.error,
          errorMessage: (error as AuthException).message),
    );
  }

  Future<void> loginWithGoogle(
    LoginWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    await BlocCommandWrapper.execute<User, AuthState>(
      currentState: state,
      emit: emit,
      command: () => loginWithGoogleUsecase.execute(),
      onLoading: (currentState) =>
          currentState.copyWith(status: AuthStatus.loading),
      onSuccess: (currentState, user) =>
          currentState.copyWith(status: AuthStatus.success, user: user),
      onError: (currentState, error) => currentState.copyWith(
          status: AuthStatus.error,
          errorMessage: (error as AuthException).message),
    );
  }
}
