import 'package:deehelp/core/wrapper/command_cubit.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/domain/usecases/list/get_products_by_user_usecase.dart';
import 'package:deehelp/features/itens/presentation/list/bloc/list_product_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: Nao usar firebase para recuperar a sessap
class ListProductCubit extends Cubit<ListProductState> {
  final GetProductsByUserUsecase _usecase;
  ListProductCubit({required GetProductsByUserUsecase usecase})
      : _usecase = usecase,
        super(const ListProductState.initial());

  Future<void> fetchItems() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) emit(const ListProductState.success([]));
    await CommandCubit.execute<List<Item>, ListProductState>(
      emit: emit,
      command: () => _usecase.execute(userId!),
      onLoading: () => const ListProductState.loading(),
      onSuccess: (items) => ListProductState.success(items),
      onError: (error) => const ListProductState.success([]),
    );
  }
}
