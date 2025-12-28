import 'package:deehelp/core/errors/failure.dart';

import '../../features/auth/domain/exceptions/auth_failure.dart';

//S estado que esta sendo gerenciado
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
