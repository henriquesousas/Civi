import 'package:deehelp/old_features/auth/domain/exceptions/auth_failure.dart';
import 'package:deehelp/old_features/auth/domain/services/operation_status.dart';
import 'package:deehelp/old_features/auth/domain/services/google_credentials.dart';
import 'package:deehelp/old_features/auth/domain/services/google_auth_service.dart';
import 'package:deehelp/old_core/resources.dart';
import 'package:deehelp/old_core/utils/result.dart';
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

      final scopes = ['email', 'profile'];
      GoogleSignInClientAuthorization? authorization =
          await authorizationClient.authorizationForScopes(scopes);
      final accessToken = authorization?.accessToken;

      if (accessToken == null) {
        final authorization2 =
            await authorizationClient.authorizationForScopes(scopes);

        if (authorization2?.accessToken == null) {
          return Result.failure(AuthFailure(R.strings.loginWithGoogleError));
        }
        authorization = authorization2;
      }

      final credentials = GoogleCredentials(
        idToken: idToken!,
        accessToken: accessToken!,
      );
      return Result.success(credentials);
    } on GoogleSignInException catch (e, _) {
      final operationStatus = e.code == GoogleSignInExceptionCode.canceled
          ? OperationStatus.canceled
          : OperationStatus.failure;

      final message = e.code == GoogleSignInExceptionCode.canceled
          ? "Cancelado pelo usuário"
          : R.strings.loginWithGoogleError;

      return Result.failure(
        AuthFailure(message, operationStatus: operationStatus),
      );
    }
  }
}
