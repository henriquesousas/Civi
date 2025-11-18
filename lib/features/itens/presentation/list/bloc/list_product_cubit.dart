import 'package:dartz/dartz.dart';
import 'package:deehelp/core/wrapper/command_cubit.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/domain/usecases/delete/delete_product_usecase.dart';
import 'package:deehelp/features/itens/domain/usecases/list/get_products_by_user_usecase.dart';
import 'package:deehelp/features/itens/presentation/list/bloc/list_product_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: Nao usar firebase para recuperar a sessap
class ListProductCubit extends Cubit<ListProductState> {
  static final String _todos = "Todos";
  final GetProductsByUserUsecase _usecase;
  final DeleteProductUsecase _deleteProductUsecase;
  List<Item> _filteredItems = [];
  List<Item> _items = [];

  ListProductCubit({
    required GetProductsByUserUsecase usecase,
    required DeleteProductUsecase deleteProductUsecase,
  })  : _usecase = usecase,
        _deleteProductUsecase = deleteProductUsecase,
        super(const ListProductState.initial());

  Future<void> fetchItems() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) emit(const ListProductState.empty());
    await CommandCubit.execute<List<Item>, ListProductState>(
      emit: emit,
      command: () => _usecase.execute(userId!),
      onLoading: () => const ListProductState.loading(),
      onError: (error) => const ListProductState.empty(),
      onSuccess: (items) {
        _items = items;
        return items.isEmpty
            ? const ListProductState.empty()
            : ListProductState.success(items, _todos);
      },
    );
  }

  Future<void> filter(String param) async {
    if (param == _todos) {
      emit(ListProductState.success(_items, _todos));
      return;
    }
    _filteredItems = _items.where((item) => item.type == param).toList();
    if (_filteredItems.isNotEmpty) {
      emit(ListProductState.success(_filteredItems, param));
    } else {
      emit(ListProductState.success([], param));
    }
  }

  Future<void> delete() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) emit(const ListProductState.error("Any"));
    await CommandCubit.execute<Unit, ListProductState>(
      emit: emit,
      command: () => _deleteProductUsecase.execute(userId!),
      onLoading: () => const ListProductState.loading(),
      onError: (error) => const ListProductState.empty(),
      onSuccess: (unit) => const ListProductState.delete(),
    );
  }
}
