import 'package:deehelp/module/auth/domain/services/operation_status.dart';

import '../../../../old_core/errors/failure.dart';

class AuthFailure extends Failure {
  final OperationStatus operationStatus;
  const AuthFailure(String message,
      {this.operationStatus = OperationStatus.failure})
      : super(message);
}
