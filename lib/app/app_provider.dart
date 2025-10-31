import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/core/resources/app_string_adapter.dart';
import 'package:deehelp/core/resources/app_strings.dart';
import 'package:deehelp/features/auth/data/firebase/firebase_auth_repository.dart';
import 'package:deehelp/features/auth/domain/auth_repository.dart';
import 'package:deehelp/features/auth/domain/usecases/login/login_with_email_and_password_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/login/bloc/login_bloc.dart';
import '../features/main/state/bottom_navigation_bloc.dart';
import '../l10n/app_localizations.dart';

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
        Provider<AppStrings>(
          create: (context) => AppStringsAdapter(AppLocalizations.of(context)),
        ),
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(),
        ),
        Provider<FirebaseAuth>(
          create: (context) => FirebaseAuth.instance,
        ),
        Provider<FirebaseFirestore>(
          create: (context) => FirebaseFirestore.instance,
        ),
        Provider<AuthRepository>(
          create: (context) => FirebaseAuthRepository(
              firebaseAuth: context.read(), firestore: context.read()),
        ),
        Provider<LoginWithEmailAndPasswordUsecase>(
          create: (context) => LoginWithEmailAndPasswordUsecase(
              repository: context.read<AuthRepository>()),
        ),
        Provider<LoginBloc>(
          create: (context) => LoginBloc(
            appStrings: context.read<AppStrings>(),
            loginWithEmailAndPasswordUseCase:
                context.read<LoginWithEmailAndPasswordUsecase>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
