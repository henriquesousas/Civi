import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/core/constants.dart';
import 'package:deehelp/core/services/media/interfaces/media_storage.dart';
import 'package:deehelp/core/services/media/r2_cloudflare_media_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../data/product_repository_firebase_storage.dart';
import '../../domain/product_repository.dart';
import '../../domain/usecases/create/create_product_usecase.dart';
import 'bloc/create_item_bloc.dart';
import 'create_item_page.dart';

class CreateItemProvider extends StatelessWidget {
  const CreateItemProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider<MediaStorage>(
          create: (context) => R2CloudFlareMediaStorage(),
        ),
        Provider<ProductRepository>(
          create: (context) => ProductRepositoryFirebaseStorage(
              firestore: context.read<FirebaseFirestore>()),
        ),
        Provider<CreateProductUseCase>(
          create: (context) => CreateProductUseCase(
            media: context.read<MediaStorage>(),
            repository: context.read<ProductRepository>(),
            bucket: Constants.imageBucket,
            imageName:
                'products/${DateTime.now().millisecondsSinceEpoch.toString()}.${"jpeg"}',
          ),
        ),
        Provider<CreateItemBloc>(
          create: (context) => CreateItemBloc(
              createItemUsecase: context.read<CreateProductUseCase>()),
        ),
      ],
      child: const CreateItemPage(),
    );
  }
}
