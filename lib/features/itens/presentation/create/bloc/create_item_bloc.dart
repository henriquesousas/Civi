import 'package:dartz/dartz.dart';
import 'package:deehelp/core/wrapper/bloc_command_wrapper.dart';
import 'package:deehelp/features/itens/domain/usecases/upload/upload_image_usecase.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_event.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/resources.dart';

class CreateItemBloc extends Bloc<ItemEvent, ItemState> {
  final UploadImageUsecase uploadImageUsecase;

  CreateItemBloc({required this.uploadImageUsecase})
      : super(ItemState.initial()) {
    on<ItemSelectedEvent>(onItemSelect);
    on<LoadItemsEvent>(onLoadItems);
    on<ItemCodeChangeEvent>(onCodeChange);
    on<ItemColorChangeEvent>(onColorChange);
    on<ItemBrandChangeEvent>(onBrandChange);
    on<ItemObsChangeEvent>(onItemObsChange);
    on<ChangePageEvent>(onChangePage);
    on<ImagePickerEvent>(onImagePicker);
    on<UploadImageEvent>(uploadImage);
  }

  Future<void> uploadImage(
    UploadImageEvent event,
    Emitter<ItemState> emit,
  ) async {
    await BlocCommandWrapper.execute<Unit, ItemState>(
      currentState: state,
      emit: emit,
      command: () => uploadImageUsecase.execute(event.file.path),
      onLoading: (currentState) =>
          currentState.copyWith(status: ItemStatus.loading),
      onSuccess: (currentState, result) =>
          currentState.copyWith(status: ItemStatus.success),
      onError: (currentState, error) => currentState.copyWith(
          status: ItemStatus.error, errorMessage: "Any error"),
    );
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

  void onImagePicker(
    ImagePickerEvent event,
    Emitter<ItemState> emit,
  ) {
    emit(state.updatePhoto(event.file));
  }

  void onItemObsChange(
    ItemObsChangeEvent event,
    Emitter<ItemState> emit,
  ) {
    emit(
      state.updateObs(event.value),
    );
  }

  void onChangePage(
    ChangePageEvent event,
    Emitter<ItemState> emit,
  ) {
    emit(state.updatePage(event.page));
  }
}
