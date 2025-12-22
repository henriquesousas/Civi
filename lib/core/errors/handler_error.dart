import 'package:deehelp/core/errors/failure.dart';

import '../../features/auth/domain/exceptions/auth_failure.dart';

STATE handleError<STATE>(
  Failure error,
  STATE Function(String message, Object? extra) errorFactory,
) {
  switch (error) {
    case AuthFailure(:final operationStatus):
      return errorFactory(error.message, operationStatus);
    default:
      return errorFactory(error.message, null);
  }
}
