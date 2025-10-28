import 'package:deehelp/core/domain/exception/app_exception.dart';
import 'package:deehelp/features/auth/data/auth_result.dart';

class AuthException extends AppException {
  AuthException({
    required super.message,
    super.stackTrace,
  });

  factory AuthException.from(final String message) {
    return AuthException(message: message);
  }

  factory AuthException.fromResult(AuthResult result) {
    return AuthException(message: result.message ?? "");
  }
}
