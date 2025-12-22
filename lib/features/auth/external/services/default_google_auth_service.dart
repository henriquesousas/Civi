import 'package:deehelp/core/errors/failure.dart';
import 'package:deehelp/features/auth/domain/services/google_credentials.dart';
import 'package:deehelp/features/auth/domain/services/google_auth_service.dart';
import 'package:deehelp/core/ui/assets/resources.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DefaultGoogleAuthService implements GoogleAuthService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool isInitialize = false;

  static Future<void> initSignIn() async {
    if (!isInitialize) {
      await _googleSignIn.initialize(
        serverClientId:
            '673259838307-a2tmdcc0oil4tmohe6r5gbcfssiklur8.apps.googleusercontent.com',
      );
    }
    isInitialize = true;
  }

  @override
  Future<Result<GoogleCredentials>> auth() async {
    try {
      initSignIn();
      final googleAccount = await _googleSignIn.authenticate();
      final idToken = googleAccount.authentication.idToken;
      final authorizationClient = googleAccount.authorizationClient;

      GoogleSignInClientAuthorization? authorization =
          await authorizationClient.authorizationForScopes(
        ['email', 'profile'],
      );
      final accessToken = authorization?.accessToken;

      if (accessToken == null) {
        final authorization2 = await authorizationClient.authorizationForScopes(
          ['email', 'profile'],
        );

        if (authorization2?.accessToken == null) {
          return Result.failure(
              AuthenticationFailure(R.strings.loginWithGoogleError));
        }
        authorization = authorization2;
      }

      final credentials = GoogleCredentials(
        idToken: idToken!,
        accessToken: accessToken!,
      );
      return Result.success(credentials);
    } catch (e, _) {
      return Result.failure(
          AuthenticationFailure(R.strings.loginWithGoogleError));
    }
  }
}
