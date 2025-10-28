import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<UserCredential> createUserWithEmailAndPassword(
    final String email,
    final String password,
  );

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  );
}
