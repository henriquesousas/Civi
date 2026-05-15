import '../../_shared/failures/exports.dart';

final class AuthException implements Exception {
  final Failure failure;
  const AuthException(this.failure);
}
