import 'package:deehelp/features/itens/data/upload_image_firebase_storage.dart';
import 'package:deehelp/features/itens/domain/upload_image_service.dart';
import 'package:deehelp/features/itens/domain/usecases/upload/upload_image_usecase.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/create_item_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CreateItemProvider extends StatelessWidget {
  const CreateItemProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider<FirebaseStorage>(
          create: (context) => FirebaseStorage.instance,
        ),
        Provider<UploadImageService>(
          create: (context) => UploadImageFirebaseStorage(
              storage: context.read<FirebaseStorage>()),
        ),
        Provider<UploadImageUsecase>(
          create: (context) => UploadImageUsecase(
              uploadService: context.read<UploadImageService>()),
        ),
        Provider<CreateItemBloc>(
          create: (context) => CreateItemBloc(
              uploadImageUsecase: context.read<UploadImageUsecase>()),
        ),
      ],
      child: const CreateItemPage(),
    );
  }
}
