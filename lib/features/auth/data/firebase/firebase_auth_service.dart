import 'package:deehelp/features/auth/data/firebase/auth_service.dart';
import 'package:deehelp/features/auth/data/firebase/firebase_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/auth_exception.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService() : _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      final String email, final String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.errorMessage);
    }
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.errorMessage);
    }
  }
}
