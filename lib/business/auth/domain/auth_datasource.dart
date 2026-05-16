import 'package:deehelp/business/auth/domain/loggued_user.dart';

abstract interface class AuthDataSource {
  Future<LogguedUser> signInWithGoogle(
    String idToken,
    String accessToken,
  );
}
