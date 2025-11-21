import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/edit/cubit/item_update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemUpdateCubit extends Cubit<ItemUpdateState> {
  ItemUpdateCubit() : super(const ItemUpdateState.initial());

  Future<void> load(Item item) async {
    emit(ItemUpdateState.load(item));
  }

  Future<void> applyModelChange(String value) async {
    await _updateItem((item) => item.copyWith(name: value));
  }

  Future<void> applyObsChange(String value) async {
    await _updateItem((item) => item.copyWith(obs: value));
  }

  Future<void> applyBrandChange(String value) async {
    await _updateItem((item) => item.copyWith(brand: value));
  }

  Future<void> applyTypeChange(String value) async {
    await _updateItem((item) => item.copyWith(type: value));
  }

  Future<void> applyColorChange(String value) async {
    await _updateItem((item) => item.copyWith(color: value));
  }

  Future<void> _updateItem(Item Function(Item) fn) async {
    final state = this.state;

    final item = state.maybeMap(
      load: (loadState) => loadState.tem,
      orElse: () => null,
    );

    if (item == null) return;

    final updatedItem = fn(item);
    emit(ItemUpdateState.load(updatedItem));
  }
}
