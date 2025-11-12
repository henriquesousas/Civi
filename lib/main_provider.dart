import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/features/auth/data/firebase/firebase_auth_repository.dart';
import 'package:deehelp/features/auth/data/firebase/firebase_auth_service.dart';
import 'package:deehelp/features/auth/data/firebase/firebase_firestore_service.dart';
import 'package:deehelp/features/auth/data/firebase/google_sign_in_service.dart';
import 'package:deehelp/features/auth/domain/auth_repository.dart';
import 'package:deehelp/features/auth/domain/usecases/login/login_with_email_and_password_usecase.dart';
import 'package:deehelp/features/auth/domain/usecases/login/login_with_google_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/login/bloc/login_bloc.dart';
import 'features/main/state/bottom_navigation_bloc.dart';

class ApplicationProvider extends StatelessWidget {
  final Widget child;

  const ApplicationProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(),
        ),
        Provider<GoogleSignInService>(
          create: (context) => GoogleSignInService(),
        ),
        Provider<FirebaseAuth>(
          create: (context) => FirebaseAuth.instance,
        ),
        Provider<FirebaseFirestore>(
          create: (context) => FirebaseFirestore.instance,
        ),
        Provider<FirebaseAuthService>(
          create: (context) => FirebaseAuthService(
            firebaseAuth: context.read<FirebaseAuth>(),
          ),
        ),
        Provider<FirebaseFirestoreService>(
          create: (context) => FirebaseFirestoreService(
            firestore: context.read<FirebaseFirestore>(),
          ),
        ),
        Provider<AuthRepository>(
          create: (context) => FirebaseAuthRepository(
            firebaseAuthService: context.read<FirebaseAuthService>(),
            firestoreService: context.read<FirebaseFirestoreService>(),
          ),
        ),
        Provider<LoginWithEmailAndPasswordUsecase>(
          create: (context) => LoginWithEmailAndPasswordUsecase(
              repository: context.read<AuthRepository>()),
        ),
        Provider<LoginWithGoogleUsecase>(
          create: (context) => LoginWithGoogleUsecase(
            googleSignInService: context.read<GoogleSignInService>(),
          ),
        ),
        Provider<LoginBloc>(
          create: (context) => LoginBloc(
            loginWithGoogleUsecase: context.read<LoginWithGoogleUsecase>(),
            loginWithEmailAndPasswordUseCase:
                context.read<LoginWithEmailAndPasswordUsecase>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
