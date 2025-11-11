import 'package:deehelp/features/itens/presentation/create/bloc/item_event.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/resources.dart';

class CreateItemBloc extends Bloc<ItemEvent, ItemState> {
  CreateItemBloc() : super(ItemState.initial()) {
    on<ItemSelectedEvent>(onItemSelect);
    on<LoadItemsEvent>(onLoadItems);
    on<ItemCodeChangeEvent>(onCodeChange);
    on<ItemColorChangeEvent>(onColorChange);
    on<ItemBrandChangeEvent>(onBrandChange);
  }

  void onCodeChange(
    ItemCodeChangeEvent event,
    Emitter<ItemState> emit,
  ) {
    final code = event.code;
    final isValid = code.length > 5;
    final error = isValid ? null : R.strings.errorMessageVehicle;
    final newState = state.updateCode(code, error: error);

    emit(newState);
  }

  void onColorChange(
    ItemColorChangeEvent event,
    Emitter<ItemState> emit,
  ) {
    final newState = state.updateColor(event.color);
    emit(newState);
  }

  void onBrandChange(
    ItemBrandChangeEvent event,
    Emitter<ItemState> emit,
  ) {
    final newState = state.updateBrand(event.brand);
    emit(newState);
  }

  void onItemSelect(
    ItemSelectedEvent event,
    Emitter<ItemState> emit,
  ) {
    final newState = state.updateItemSelected(event.item);
    emit(newState);
  }

  void onLoadItems(
    LoadItemsEvent event,
    Emitter<ItemState> emit,
  ) {
    final newState = state.loadItems();
    emit(newState);
  }
}
