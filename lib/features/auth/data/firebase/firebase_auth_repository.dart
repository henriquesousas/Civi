import 'package:deehelp/core/domain/extension/either_extension.dart';
import 'package:deehelp/features/auth/data/auth_result.dart';
import 'package:deehelp/features/auth/data/firebase/firebase_auth_service.dart';
import 'package:deehelp/features/auth/data/firebase/firebase_extension.dart';
import 'package:deehelp/features/auth/data/firebase/firebase_firestore_service.dart';
import 'package:deehelp/features/auth/data/user_model.dart';
import 'package:deehelp/features/auth/domain/auth_repository.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuthService firebaseAuthService;
  final FirebaseFirestoreService firestoreService;

  FirebaseAuthRepository({
    required this.firebaseAuthService,
    required this.firestoreService,
  });

  @override
  Future<AuthResult> save(User user) async {
    try {
      final result = await firebaseAuthService
          .createUserWithEmailAndPassword(
        user.email.value,
        user.password!.value,
        user.name.value,
      )
          .flatMapAsync((credential) {
        return firestoreService.save(
            UserModel.toMap(user), credential.user!.uid);
      });

      return result.fold(
        (error) async {
          await firebaseAuthService.delete();
          return AuthResult.failure(error.message ?? "");
        },
        (document) => AuthResult.success(user),
      );
    } on FirebaseAuthException catch (e) {
      await firebaseAuthService.delete();
      return AuthResult.failure(e.errorMessage);
    } on Exception catch (e) {
      await firebaseAuthService.delete();
      return AuthResult.failure(e.toString());
    }
  }

  @override
  Future<AuthResult> login(
    String email,
    String password,
  ) async {
    try {
      final result = await firebaseAuthService
          .signInWithEmailAndPassword(email, password)
          .flatMapAsync((usrCredentials) async =>
              firestoreService.get(usrCredentials.user!));

      return result.fold(
        (e) => AuthResult.failure(e.errorMessage),
        (document) => AuthResult.success(UserModel.toUser(document.data()!)),
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(e.errorMessage);
    } catch (e) {
      return AuthResult.failure(e.toString());
    }
  }
}
