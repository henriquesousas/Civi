// // ignore_for_file: invalid_use_of_visible_for_testing_member
// // ignore_for_file: subtype_of_sealed_class
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:deehelp/features/auth/data/firebase/firebase_auth_repository.dart';
// import 'package:deehelp/features/auth/domain/gender.dart';
// import 'package:deehelp/features/auth/domain/user_builder.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
//
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}
//
// class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}
//
// class MockUserCredential extends Mock implements UserCredential {}
//
// class MockUser extends Mock implements User {}
//
// class MockUsersCollectionRef extends Mock
//     implements CollectionReference<Map<String, dynamic>> {}
//
// class MockUserDocumentRef extends Mock
//     implements DocumentReference<Map<String, dynamic>> {}
//
// void main() {
//   late FirebaseAuthRepository sut;
//   late MockFirebaseAuth mockFirebaseAuth;
//   late MockFirebaseFirestore mockFirestore;
//   late MockUserCredential mockUserCredential;
//   late MockUser mockFirebaseUser;
//
//   final mockCollection = MockUsersCollectionRef();
//   final mockDocument = MockUserDocumentRef();
//
//   final expectedUser = UserBuilder(
//     name: "any name",
//     surName: "any surname",
//     email: "any@mail.com",
//     phone: "11972724465",
//     password: "123456",
//     gender: Gender.male,
//   ).build();
//
//   const expectedFirebaseUuid = 'user-123';
//
//   setUpAll(() {
//     registerFallbackValue(<String, dynamic>{});
//   });
//
//   setUp(() {
//     mockFirebaseAuth = MockFirebaseAuth();
//     mockFirestore = MockFirebaseFirestore();
//     mockUserCredential = MockUserCredential();
//     mockFirebaseUser = MockUser();
//
//     sut = FirebaseAuthRepository(
//       firebaseAuth: mockFirebaseAuth,
//       firestore: mockFirestore,
//     );
//
//     //Commons mocks
//     when(() => mockUserCredential.user).thenReturn(mockFirebaseUser);
//     when(() => mockFirebaseUser.uid).thenReturn(expectedFirebaseUuid);
//     when(() => mockFirestore.collection("users")).thenReturn(mockCollection);
//     when(() => mockCollection.doc(expectedFirebaseUuid))
//         .thenReturn(mockDocument);
//     when(() => mockDocument.set(any())).thenAnswer((_) => Future.value());
//     when(() => mockFirebaseUser.updateProfile(
//           displayName: any(named: 'displayName'),
//         )).thenAnswer((_) async => Future.value());
//   });
//
//   test("givenValidUser_whenSaveCalled_thenShouldReturnSuccess", () async {
//     when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
//           email: any(named: 'email'),
//           password: any(named: 'password'),
//         )).thenAnswer((_) async => mockUserCredential);
//
//     final result = await sut.save(expectedUser);
//
//     expect(result.success, isTrue);
//     expect(result.user, equals(expectedUser));
//     verify(() => mockFirestore.collection('users')).called(1);
//     verify(() => mockFirebaseUser.updateProfile(
//           displayName: expectedUser.name.value,
//         )).called(1);
//   });
//
//   test(
//       "givenValidUser_whenSaveCalled_andThrowFirebaseAuthException_thenShouldReturnFailure",
//       () async {
//     final expectedErrorMessage =
//         'Este email já está em uso. Tente fazer login.';
//     final expectedException = FirebaseAuthException(
//       code: 'email-already-in-use',
//       message: 'any',
//     );
//
//     when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
//           email: any(named: 'email'),
//           password: any(named: 'password'),
//         )).thenThrow(expectedException);
//
//     final result = await sut.save(expectedUser);
//
//     expect(result.success, isFalse);
//     expect(result.message, expectedErrorMessage);
//     expect(result.user, isNull);
//
//     verifyNever(() => mockFirebaseUser.delete()).called(0);
//     verifyNever(() => mockFirestore.collection('users')).called(0);
//     verifyNever(() => mockFirebaseUser.updateProfile(
//         displayName: expectedUser.name.value)).called(0);
//   });
//
//   test(
//       "givenValidUser_whenSaveCalled_andThrowAnyException_thenShouldReturnFailure",
//       () async {
//     final expectedException = Exception("any");
//     when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
//           email: any(named: 'email'),
//           password: any(named: 'password'),
//         )).thenThrow(expectedException);
//
//     final result = await sut.save(expectedUser);
//
//     expect(result.success, isFalse);
//     expect(result.message, "Erro inesperado: ${expectedException.toString()}");
//     expect(result.user, isNull);
//     verifyNever(() => mockFirestore.collection('users')).called(0);
//     verifyNever(() => mockFirebaseUser.updateProfile(
//         displayName: expectedUser.name.value)).called(0);
//   });
//
//   test(
//       "givenValidUser_whenSaveCalled_andFirestoreThrowAnyException_thenShouldReturnFailure",
//       () async {
//     final expectedException = Exception("any");
//     when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
//           email: any(named: 'email'),
//           password: any(named: 'password'),
//         )).thenAnswer((_) async => mockUserCredential);
//
//     when(() => mockFirestore.collection('users')).thenThrow(expectedException);
//     when(() => mockFirebaseUser.delete())
//         .thenAnswer((_) async => Future.value());
//
//     final result = await sut.save(expectedUser);
//
//     expect(result.success, isFalse);
//     expect(result.message, "Erro inesperado: ${expectedException.toString()}");
//     expect(result.user, isNull);
//     verify(() => mockFirebaseUser.delete()).called(1);
//   });
// }
