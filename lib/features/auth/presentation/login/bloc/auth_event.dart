abstract class AuthEvent {}

class LoginWithGoogleEvent extends AuthEvent {}

class LoginWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  LoginWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
}

class EmailChangedEvent extends AuthEvent {
  final String email;
  final bool isValid;

  EmailChangedEvent({
    required this.email,
    this.isValid = false,
  });
}

class PasswordChangedEvent extends AuthEvent {
  final String password;
  final bool isValid;

  PasswordChangedEvent({
    required this.password,
    this.isValid = false,
  });
}

class PasswordChangedObscureTextEvent extends AuthEvent {
  final bool obscureText;

  PasswordChangedObscureTextEvent({
    this.obscureText = true,
  });
}

class GetUserEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}
