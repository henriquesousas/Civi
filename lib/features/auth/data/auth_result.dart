import '../domain/entity/user.dart';

class AuthResult {
  final bool success;
  final User? user;
  final bool isNewUser;
  final String? message;

  AuthResult({
    required this.success,
    this.user,
    this.message,
    this.isNewUser = false,
  });

  factory AuthResult.success(User user, {bool isNewUser = false}) {
    return AuthResult(
      success: true,
      user: user,
      isNewUser: isNewUser,
    );
  }

  factory AuthResult.failure(String message) {
    return AuthResult(success: false, message: message);
  }
}
