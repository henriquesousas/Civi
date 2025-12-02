import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/features/my_products/data/product_repository_firebase_storage.dart';
import 'package:deehelp/features/my_products/domain/product_repository.dart';
import 'package:deehelp/features/my_products/domain/usecases/delete/delete_product_usecase.dart';
import 'package:deehelp/features/my_products/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/features/my_products/presentation/update/update_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../../core/services/media/interfaces/media_storage.dart';
import '../../../../core/services/media/r2_cloudflare_media_storage.dart';
import '../../domain/entities/product.dart';
import 'product_edit_modal_cubit.dart';
import 'update_product_cubit.dart';

class UpdateProductProvider extends StatelessWidget {
  final Product item;
  const UpdateProductProvider({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<MediaStorage>(
          create: (context) => R2CloudFlareMediaStorage(),
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepositoryFirebaseStorage(
            firestore: context.read<FirebaseFirestore>(),
          ),
        ),
        RepositoryProvider<UpdateProductUseCase>(
          create: (context) => UpdateProductUseCase(
              repository: context.read<ProductRepository>()),
        ),
        RepositoryProvider<DeleteProductUsecase>(
          create: (context) => DeleteProductUsecase(
            repository: context.read<ProductRepository>(),
            mediaStorage: context.read<MediaStorage>(),
            bucket: Constants.imageBucket,
          ),
        ),
        BlocProvider<UpdateProductCubit>(
          create: (context) => UpdateProductCubit(
            updateProductUseCase: context.read<UpdateProductUseCase>(),
            deleteProductUseCase: context.read<DeleteProductUsecase>(),
          ),
        ),
        BlocProvider<ProductEditModalCubit>(
          create: (context) => ProductEditModalCubit(),
        ),
      ],
      child: UpdateProductPage(product: item),
    );
  }
}
