import 'package:deehelp/business/_shared/failures/exports.dart';
import 'package:deehelp/business/_shared/failures/failure.dart';
import 'package:deehelp/business/auth/domain/google_auth_failure.dart';
import 'package:deehelp/core/env_config.dart';
import 'package:deehelp/business/auth/external/google/google_credentials.dart';
import 'package:deehelp/business/auth/external/google/google_auth_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';

class GoogleAuthServiceDefault implements GoogleAuthService {
  static final _logger = Logger("DefaultGoogleAuthService");
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool isInitialize = false;

  static Future<void> initSignIn() async {
    if (!isInitialize) {
      await _googleSignIn.initialize(
        serverClientId: EnvConfig.googleServiceClientId,
      );
    }
    isInitialize = true;
  }

  @override
  TaskEither<Failure, GoogleCredentials> auth() => TaskEither.Do(
        ($) async {
          try {
            initSignIn();
            _logger.info("Chamou o googleSignIn authenticate");

            final (authorizationClient, idToken) =
                await _requestAuthorization();

            _logger.info("authorizationClient: $authorizationClient");
            _logger.info("IdToken : $idToken");

            if (idToken == null) {
              return $(TaskEither.left(const GoogleAuthFailure()));
            }

            final accessToken =
                await _authorizationForScopes(authorizationClient);
            _logger.info("accessToken: $accessToken");

            if (accessToken == null) {
              return $(TaskEither.left(const GoogleAuthFailure()));
            }

            final credentials = GoogleCredentials(
              idToken: idToken,
              accessToken: accessToken,
            );
            _logger.info("credentials: ${credentials.toString()}");
            return $(TaskEither.right(credentials));
          } on GoogleSignInException catch (e, _) {
            _logger.info(
                "DefaultGoogleAuthService login com google error => ${e.description}");
            _logger.info(
                "DefaultGoogleAuthService login com google error => ${e.details.toString()}");

            final ex = e.code == GoogleSignInExceptionCode.canceled
                ? const GoogleAuthFailure("Cancelado pelo usuário")
                : const GoogleAuthFailure();

            return $(TaskEither.left(ex));
          }
        },
      );

  Future<(GoogleSignInAuthorizationClient, String?)>
      _requestAuthorization() async {
    final googleAccount = await _googleSignIn.authenticate();
    _logger
        .info("Resposta do authenticate do google ${googleAccount.toString()}");
    final idToken = googleAccount.authentication.idToken;
    return (googleAccount.authorizationClient, idToken);
  }

  Future<String?> _authorizationForScopes(
    GoogleSignInAuthorizationClient authorizationClient,
  ) async {
    final scopes = ['email', 'profile'];
    GoogleSignInClientAuthorization? authorization =
        await authorizationClient.authorizationForScopes(scopes);

    final accessToken = authorization?.accessToken;
    _logger.info("accessToken: $accessToken");
    return accessToken;
    // if (accessToken == null) {
    //   final authorization2 =
    //       await authorizationClient.authorizationForScopes(scopes);

    //   if (authorization2?.accessToken == null) {
    //     throw const GoogleAuthFailure();
    //   }
    //   authorization = authorization2;
    // }
  }
}
