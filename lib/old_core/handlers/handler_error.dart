import 'package:deehelp/old_core/errors/failure.dart';

import '../../module/auth/domain/exceptions/auth_failure.dart';

/// S estado que esta sendo gerenciado
S handleError<S>(
  Failure error,
  S Function(String message, Object? extra) errorFactory,
) {
  switch (error) {
    case AuthFailure(:final operationStatus):
      return errorFactory(error.message, operationStatus);
    default:
      return errorFactory(error.message, null);
  }
}
