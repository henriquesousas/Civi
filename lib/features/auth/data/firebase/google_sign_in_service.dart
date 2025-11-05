import 'package:dartz/dartz.dart';
import 'package:deehelp/core/resources/resources.dart';
import 'package:deehelp/features/auth/data/auth_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

//TODO: DI
class GoogleSignInService {
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

  Future<Either<AuthResult, Map<String, dynamic>>> signIn() async {
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
          return Left(AuthResult.failure(R.strings.loginWithGoogleError));
        }
        authorization = authorization2;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user == null) {
        return Left(AuthResult.failure(R.strings.loginWithGoogleError));
      }

      final user = userCredential.user!;
      return Right({
        'uid': user.uid,
        'email': user.email ?? '',
        'name': user.displayName ?? '',
        'photoUrl': user.photoURL ?? '',
      });
    } catch (e, _) {
      return Left(AuthResult.failure(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await initSignIn();

      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
