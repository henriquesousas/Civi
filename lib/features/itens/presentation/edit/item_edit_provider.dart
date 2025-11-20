import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/edit/cubit/item_update_cubit.dart';
import 'package:deehelp/features/itens/presentation/edit/item_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemEditProvider extends StatelessWidget {
  final Item item;
  const ItemEditProvider({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //TODO: Deixar no provide principal
        // RepositoryProvider<FirebaseFirestore>(
        //   create: (context) => FirebaseFirestore.instance,
        // ),
        // RepositoryProvider<ItemRepository>(
        //   create: (context) => ItemRepositoryFirebaseStorage(
        //     firestore: context.read<FirebaseFirestore>(),
        //   ),
        // ),
        // RepositoryProvider<GetProductsByUserUsecase>(
        //   create: (context) => GetProductsByUserUsecase(
        //     repository: context.read<ItemRepository>(),
        //   ),
        // ),
        // RepositoryProvider<DeleteProductUsecase>(
        //   create: (context) => DeleteProductUsecase(
        //       repository: context.read<ItemRepository>(),
        //       mediaStorage: R2MediaStorage(),
        //       bucket: Constants.imageBucket),
        // ),
        BlocProvider<ItemUpdateCubit>(
          create: (context) => ItemUpdateCubit(),
        ),
      ],
      child: ItemEditPage(item: item),
    );
  }
}
