import 'package:equatable/equatable.dart';

import '../../../domain/entity/user.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  logout,
  error;
}

class EmailState {
  final String value;
  final String? error;

  const EmailState({
    this.value = '',
    this.error,
  });

  EmailState copyWith({
    String? value,
    String? error,
  }) {
    return EmailState(
      value: value ?? this.value,
      error: error,
    );
  }

  bool get isValid => error == null && value.isNotEmpty;
  bool get hasError => error != null;
}

class PasswordState {
  final String? value;
  final String? error;
  final bool obscureText;

  const PasswordState({
    this.value,
    this.error,
    this.obscureText = false,
  });

  PasswordState copyWith({
    String? value,
    String? error,
    bool? obscureText,
  }) {
    return PasswordState(
      value: value ?? this.value,
      obscureText: obscureText ?? this.obscureText,
      error: error,
    );
  }

  PasswordState withObscureText(bool obscureText) {
    return copyWith(obscureText: obscureText);
  }
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

  @override
  List<Object?> get props => [status, errorMessage, user, email, password];
}
