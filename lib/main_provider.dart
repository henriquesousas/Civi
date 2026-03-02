// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:deehelp/features/auth/data/google/google_authentication_service.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// class ApplicationProvider extends StatelessWidget {
//   final Widget child;

//   const ApplicationProvider({
//     super.key,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         // Provider<UserPreferencesRepository>(
//         //   create: (context) => UserPreferencesSharedPrefsRepository(),
//         // ),
//         // Provider<UserSessionService>(
//         //   create: (context) => UserSessionServiceSharedPrefs(),
//         // ),
//         // Provider<GoogleAuthenticationService>(
//         //   create: (context) => GoogleAuthenticationService(),
//         // ),
//         // Provider<FirebaseAuth>(
//         //   create: (context) => FirebaseAuth.instance,
//         // ),
//         // Provider<FirebaseFirestore>(
//         //   create: (context) => FirebaseFirestore.instance,
//         // ),
//         // Provider<FirebaseAuthService>(
//         //   create: (context) => FirebaseAuthService(
//         //     firebaseAuth: context.read<FirebaseAuth>(),
//         //   ),
//         // ),
//         // Provider<FirebaseFirestoreService>(
//         //   create: (context) => FirebaseFirestoreService(
//         //     firestore: context.read<FirebaseFirestore>(),
//         //   ),
//         // ),
//         // Provider<AuthRepository>(
//         //   create: (context) => FirebaseAuthRepository(
//         //     firebaseAuthService: context.read<FirebaseAuthService>(),
//         //     firestoreService: context.read<FirebaseFirestoreService>(),
//         //   ),
//         // ),
//         // Provider<LoginWithEmailAndPasswordUsecase>(
//         //   create: (context) => LoginWithEmailAndPasswordUsecase(
//         //       repository: context.read<AuthRepository>()),
//         // ),
//         // Provider<LoginWithGoogleUsecase>(
//         //   create: (context) => LoginWithGoogleUsecase(
//         //     googleSignInService: context.read<GoogleSignInService>(),
//         //   ),
//         // ),
//         // Provider<LoginBloc>(
//         //   create: (context) => LoginBloc(
//         //     loginWithGoogleUsecase: context.read<LoginWithGoogleUsecase>(),
//         //     loginWithEmailAndPasswordUseCase:
//         //         context.read<LoginWithEmailAndPasswordUsecase>(),
//         //   ),
//         // ),
//       ],
//       child: child,
//     );
//   }
// }
