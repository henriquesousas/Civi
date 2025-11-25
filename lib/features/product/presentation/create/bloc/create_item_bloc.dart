import 'package:dartz/dartz.dart';
import 'package:deehelp/core/wrapper/bloc_command_wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/resources.dart';
import '../../../domain/product_exception.dart';
import '../../../domain/usecases/create/create_product_dto.dart';
import '../../../domain/usecases/create/create_product_usecase.dart';
import 'item_event.dart';
import 'item_state.dart';

//TODO: Remover o Firebase.instance
class CreateItemBloc extends Bloc<ItemEvent, ItemState> {
  final CreateProductUseCase createItemUsecase;

  CreateItemBloc({required this.createItemUsecase})
      : super(ItemState.initial()) {
    on<ItemSelectedEvent>(onItemSelect);
    on<LoadItemsEvent>(onLoadItems);
    on<ItemCodeChangeEvent>(onCodeChange);
    on<ItemModelEvent>(onModelChange);
    on<ItemYearEvent>(onYearChange);
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
    final dto = CreateProductDto(
      userId: FirebaseAuth.instance.currentUser!.uid,
      name: state.detailModel.value!,
      year: int.parse(state.detailYear.value!),
      type: state.detailItem.selectedItem!.name,
      image: state.image!,
      code: state.detailCode.code!,
      color: state.detailColor.color!,
      brand: state.detailBrand.brand!,
      obs: state.itemObs.value,
    );
    await BlocCommandWrapper.execute<Unit, ItemState>(
      currentState: state,
      emit: emit,
      command: () => createItemUsecase.execute(dto),
      onLoading: (currentState) =>
          currentState.copyWith(status: ItemStatus.loading),
      onSuccess: (currentState, result) =>
          currentState.copyWith(status: ItemStatus.success),
      onError: (currentState, error) => currentState.copyWith(
          status: ItemStatus.error,
          errorMessage: (error as ProductException).message),
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

  void onModelChange(
    ItemModelEvent event,
    Emitter<ItemState> emit,
  ) {
    final value = event.value;
    final isValid = value.length > 3;
    final error = isValid ? null : R.strings.errorMessageModel;
    final newState = state.updateModel(value, error: error);

    emit(newState);
  }

  void onYearChange(
    ItemYearEvent event,
    Emitter<ItemState> emit,
  ) {
    final value = event.value;
    final valueParse = int.parse(value);
    final isValid = valueParse >= 1900 && valueParse <= DateTime.now().year + 1;

    final error = isValid ? null : R.strings.errorMessageYear;
    final newState = state.updateYear(value, error: error);

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
    emit(state.updatePhoto(event.image));
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
