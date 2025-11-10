import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/create_new_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CreateNewItemPageProvider extends StatelessWidget {
  const CreateNewItemPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provider<AuthRepository>(
        //   create: (context) => FirebaseAuthRepository(
        //     firebaseAuthService: context.read<FirebaseAuthService>(),
        //     firestoreService: context.read<FirebaseFirestoreService>(),
        //   ),
        // ),
        // Provider<LoginWithEmailAndPasswordUsecase>(
        //   create: (context) => LoginWithEmailAndPasswordUsecase(
        //       repository: context.read<AuthRepository>()),
        // ),
        // Provider<LoginWithGoogleUsecase>(
        //   create: (context) => LoginWithGoogleUsecase(
        //     googleSignInService: context.read<GoogleSignInService>(),
        //   ),
        // ),
        Provider<CreateItemBloc>(
          create: (context) => CreateItemBloc(),
        ),
      ],
      child: const CreateNewItemPage(),
    );
  }
}
