import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/features/product/data/product_repository_firebase_storage.dart';
import 'package:deehelp/features/product/domain/product_repository.dart';
import 'package:deehelp/features/product/domain/usecases/update/update_product_usecase.dart';
import 'package:deehelp/features/product/presentation/update/update_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import 'cubit/modal/item_modal_cubit.dart';
import 'cubit/update_product_cubit.dart';

class UpdateProductProvider extends StatelessWidget {
  final Product item;
  const UpdateProductProvider({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepositoryFirebaseStorage(
            firestore: context.read<FirebaseFirestore>(),
          ),
        ),
        RepositoryProvider<UpdateProductUseCase>(
          create: (context) => UpdateProductUseCase(
              repository: context.read<ProductRepository>()),
        ),
        BlocProvider<UpdateProductCubit>(
          create: (context) => UpdateProductCubit(
            updateProductUseCase: context.read<UpdateProductUseCase>(),
          ),
        ),
        BlocProvider<ItemModalCubit>(
          create: (context) => ItemModalCubit(),
        ),
      ],
      child: UpdateProductPage(item: item),
    );
  }
}
