import 'package:deehelp/features/auth/presentation/login/bloc/password_state.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/user.dart';
import 'email_state.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  logout,
  error;
}

class AuthState extends Equatable {
  final AuthStatus status;
  final EmailState email;
  final PasswordState password;
  final String? errorMessage;
  final User? user;

  const AuthState._({
    required this.status,
    required this.email,
    required this.password,
    this.errorMessage,
    this.user,
  });

  bool get isFormValid => email.isValid && password.isValid;

  factory AuthState.initial() => const AuthState._(
        status: AuthStatus.initial,
        email: EmailState(),
        password: PasswordState(),
      );

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? errorMessage,
    EmailState? email,
    PasswordState? password,
  }) {
    return AuthState._(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  AuthState updatePasswordState(String pwd, String? error) {
    final newState = password.copyWith(
      value: pwd,
      error: error,
    );
    return copyWith(password: newState);
  }

  AuthState updateEmailState(String newEmail, String? error) {
    final newState = email.copyWith(
      value: newEmail,
      error: error,
    );
    return copyWith(email: newState);
  }

  AuthState updatePasswordVisibilityState(bool obscureText) {
    final newState = password.copyWith(
      obscureText: obscureText,
      error: password.error,
    );
    return copyWith(password: newState);
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        user,
        email,
        password,
        isFormValid,
      ];
}
