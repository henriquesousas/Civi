import 'package:deehelp/business/auth/domain/logged_user.dart';

abstract interface class AuthDataSource {
  Future<LoggedUser> signInWithGoogle(
    String idToken,
    String accessToken,
  );
}
