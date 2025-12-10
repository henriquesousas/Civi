import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deehelp/core/ui/assets/resources.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFirestoreService {
  static const String _userCollection = "users";
  final FirebaseFirestore firestore;

  FirebaseFirestoreService({required this.firestore});

  Future<Either<FirebaseAuthException, DocumentSnapshot<Map<String, dynamic>>>>
      get(User user) async {
    final doc = await firestore.collection(_userCollection).doc(user.uid).get();

    if (!doc.exists) {
      return Left(FirebaseAuthException(
        code: "user-not-found",
        message: "loginInvalidCredentialsError",
      ));
    }

    return Right(doc);
  }

  Future<Either<FirebaseAuthException, Unit>> save(
    Map<String, dynamic> data,
    String path,
  ) async {
    await firestore.collection(_userCollection).doc(path).set(data);
    return const Right(unit);
  }
}
