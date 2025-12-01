import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/core/services/media/r2_cloudflare_media_storage.dart';
import 'package:deehelp/features/product/presentation/listing/listing_my_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../data/product_repository_firebase_storage.dart';
import '../../domain/product_repository.dart';
import '../../domain/usecases/delete/delete_product_usecase.dart';
import '../../domain/usecases/list/get_products_by_user_usecase.dart';
import 'listing_my_products_cubit.dart';

class ListingMyProductsProvider extends StatelessWidget {
  final bool showBackButton;
  const ListingMyProductsProvider({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //TODO: Deixar no provide principal
        RepositoryProvider<FirebaseFirestore>(
          create: (context) => FirebaseFirestore.instance,
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepositoryFirebaseStorage(
            firestore: context.read<FirebaseFirestore>(),
          ),
        ),
        RepositoryProvider<GetProductsByUserUsecase>(
          create: (context) => GetProductsByUserUsecase(
            repository: context.read<ProductRepository>(),
          ),
        ),
        RepositoryProvider<DeleteProductUsecase>(
          create: (context) => DeleteProductUsecase(
              repository: context.read<ProductRepository>(),
              mediaStorage: R2CloudFlareMediaStorage(),
              bucket: Constants.imageBucket),
        ),
        BlocProvider<ProductListingCubit>(
          create: (context) => ProductListingCubit(
            usecase: context.read<GetProductsByUserUsecase>(),
            deleteProductUsecase: context.read<DeleteProductUsecase>(),
          ),
        ),
      ],
      child: ListingMyProductsPage(showBackButton: showBackButton),
    );
  }
}
