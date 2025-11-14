import 'package:deehelp/core/services/upload/r2_upload_image.dart';
import 'package:deehelp/core/services/upload/upload_image.dart';
import 'package:deehelp/features/itens/domain/usecases/upload/create_item_usecase.dart';
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
        Provider<MediaStorage>(
          create: (context) =>
              R2UploadImage(storage: context.read<FirebaseStorage>()),
        ),
        Provider<CreateItemUsecase>(
          create: (context) =>
              CreateItemUsecase(media: context.read<MediaStorage>()),
        ),
        Provider<CreateItemBloc>(
          create: (context) => CreateItemBloc(
              createItemUsecase: context.read<CreateItemUsecase>()),
        ),
      ],
      child: const CreateItemPage(),
    );
  }
}
