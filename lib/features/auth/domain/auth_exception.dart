import 'package:deehelp/core/domain/exception/app_exception.dart';

class AuthException extends AppException {
  AuthException({
    required super.message,
    super.stackTrace,
  });
}
