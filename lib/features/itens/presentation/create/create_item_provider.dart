import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/core/services/upload/media_storage.dart';
import 'package:deehelp/core/services/upload/r2_media_storage.dart';
import 'package:deehelp/features/itens/data/item_repository_firebase_storage.dart';
import 'package:deehelp/features/itens/domain/item_repository.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/create_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/usecases/create/create_item_usecase.dart';

class CreateItemProvider extends StatelessWidget {
  const CreateItemProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider<MediaStorage>(
          create: (context) => R2MediaStorage(),
        ),
        Provider<ItemRepository>(
          create: (context) => ItemRepositoryFirebaseStorage(
              firestore: context.read<FirebaseFirestore>()),
        ),
        Provider<CreateItemUsecase>(
          create: (context) => CreateItemUsecase(
            media: context.read<MediaStorage>(),
            repository: context.read<ItemRepository>(),
            bucket: 'deehelp',
            imageName:
                'products/${DateTime.now().millisecondsSinceEpoch.toString()}.${"jpeg"}',
          ),
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
