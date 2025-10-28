import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/features/auth/data/auth_result.dart';
import 'package:deehelp/features/auth/data/firebase/firebase_extension.dart';
import 'package:deehelp/features/auth/data/user_model.dart';
import 'package:deehelp/features/auth/domain/auth_repository.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException, UserCredential;

class FirebaseAuthRepository implements AuthRepository {
  static const String _userCollection = "users";
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  FirebaseAuthRepository({required this.firebaseAuth, required this.firestore});

  @override
  Future<AuthResult> save(User user) async {
    UserCredential? credentials;
    try {
      credentials = await _createUserInFirebaseAuth(user);

      await _saveUserInFirestore(credentials, user);

      return AuthResult.success(user);
    } on FirebaseAuthException catch (e) {
      await _rollback(credentials);
      return AuthResult.error(e.errorMessage);
    } on Exception catch (e) {
      await _rollback(credentials);
      return AuthResult.error('Erro inesperado: ${e.toString()}');
    }
  }

  @override
  Future<AuthResult> login(
    String email,
    String password,
  ) async {
    try {
      final credentials = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = await _getUserFromFirestore(credentials);

      return AuthResult.success(user);
    } on FirebaseAuthException catch (e) {
      return AuthResult.error(e.errorMessage);
    } catch (e) {
      return AuthResult.error('Erro inesperado: ${e.toString()}');
    }
  }

  Future<void> _rollback(UserCredential? credential) async {
    await credential?.user?.delete();
  }

  Future<void> _saveUserInFirestore(
    UserCredential credentials,
    User user,
  ) async {
    final firebaseUser = credentials.user!;
    await firestore
        .collection(_userCollection)
        .doc(firebaseUser.uid)
        .set(UserModel.toMap(user));
  }

  Future<UserCredential> _createUserInFirebaseAuth(User user) async {
    final credentials = await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email.value,
      password: user.password.value,
    );

    credentials.user!.updateProfile(displayName: user.name.value);

    return credentials;
  }

  Future<User> _getUserFromFirestore(UserCredential credentials) async {
    final doc = await firestore
        .collection(_userCollection)
        .doc(credentials.user!.uid)
        .get();

    return UserModel.toUser(doc.data()!);
  }
}
