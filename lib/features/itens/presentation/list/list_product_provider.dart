import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deehelp/features/itens/data/item_repository_firebase_storage.dart';
import 'package:deehelp/features/itens/domain/item_repository.dart';
import 'package:deehelp/features/itens/domain/usecases/list/get_products_by_user_usecase.dart';
import 'package:deehelp/features/itens/presentation/list/bloc/list_product_cubit.dart';
import 'package:deehelp/features/itens/presentation/list/list_items_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProductProvider extends StatelessWidget {
  const ListProductProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //TODO: Deixar no provide principal
        RepositoryProvider<FirebaseFirestore>(
          create: (context) => FirebaseFirestore.instance,
        ),
        RepositoryProvider<ItemRepository>(
          create: (context) => ItemRepositoryFirebaseStorage(
            firestore: context.read<FirebaseFirestore>(),
          ),
        ),
        RepositoryProvider<GetProductsByUserUsecase>(
          create: (context) => GetProductsByUserUsecase(
            repository: context.read<ItemRepository>(),
          ),
        ),
        BlocProvider<ListProductCubit>(
            create: (context) => ListProductCubit(
                usecase: context.read<GetProductsByUserUsecase>())),
      ],
      child: const ListItemPage(),
    );
  }
}
