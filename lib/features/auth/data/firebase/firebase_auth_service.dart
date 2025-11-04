import 'package:dartz/dartz.dart';
import 'package:deehelp/core/resources/resources.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth;
  UserCredential? _credential;

  FirebaseAuthService({required this.firebaseAuth});

  Future<Either<FirebaseAuthException, UserCredential>>
      signInWithEmailAndPassword(String email, String password) async {
    final credentials = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credentials.user == null) {
      return Left(FirebaseAuthException(
          message: R.strings.loginInvalidCredentialsError,
          code: "invalid-credential"));
    }

    return Right(credentials);
  }

  Future<Either<FirebaseAuthException, UserCredential>>
      createUserWithEmailAndPassword(
    String email,
    String password,
    String? displayName,
  ) async {
    final credentials = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credentials.user == null) {
      return Left(FirebaseAuthException(
          message: R.strings.loginInvalidCredentialsError,
          code: "invalid-credential"));
    }

    if (displayName != null) {
      credentials.user!.updateProfile(displayName: displayName);
    }
    _credential = credentials;
    return Right(credentials);
  }

  Future<void> delete() async {
    await _credential?.user?.delete();
  }
}
