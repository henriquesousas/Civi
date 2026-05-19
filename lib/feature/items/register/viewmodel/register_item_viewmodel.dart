import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/module/item/domain/usecases/add/item_validate_usecase.dart';
import 'package:deehelp/old_core/handlers/handler_error.dart';
import 'package:deehelp/old_core/handlers/handle_command.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/domain/usecases/add/add_product_usecase.dart';
import 'package:deehelp/module/item/domain/usecases/add/dtos/add_product_dto.dart';
import 'package:deehelp/feature/items/register/viewmodel/add_product_state.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class RegisterItemViewmodel extends StateNotifier<AddProductState> {
  final AddProductUseCase _addProductUseCase;
  final ItemValidaUseCase _itemValidateUseCase;
  RegisterItemViewmodel({
    required AddProductUseCase addProductUseCase,
    required ItemValidaUseCase itemValidateUseCase,
  })  : _addProductUseCase = addProductUseCase,
        _itemValidateUseCase = itemValidateUseCase,
        super(AddProductState.initial());

  void reset() {
    state = state.copyWith(isValidateApi: false);
  }

  void save(String userId, {bool hasImage = true}) async {
    final dto = AddProductDto(
      userId: userId,
      name: state.model!,
      year: state.year!,
      type: state.type.name,
      images: state.imageMedia,
      code: state.licencePlate!,
      color: state.color!,
      brand: state.brand!,
      obs: state.obs,
    );

    await HandleCommand.execute<Unit, AddProductState>(
      updateState: (newState) => state = newState,
      command: () => _addProductUseCase.execute(dto),
      onLoading: () {
        return state.copyWith(
          isLoading: hasImage,
          isLoadingWithImage: hasImage == false,
          errorMessage: null,
          isSuccess: false,
        );
      },
      onSuccess: (result) {
        return state.copyWith(
          isSuccess: true,
          isLoading: false,
          isLoadingWithImage: false,
        );
      },
      onError: (error) {
        return handleError<AddProductState>(
          error,
          (message, _) {
            return state.copyWith(
              errorMessage: message,
              isLoading: false,
              isLoadingWithImage: false,
            );
          },
        );
      },
    );
  }

  void validate() async {
    if (state.licencePlate == null) return;
    final dto = GetItemDto(code: state.licencePlate!, type: state.type);

    await HandleCommand.execute<Unit, AddProductState>(
      updateState: (newState) => state = newState,
      command: () => _itemValidateUseCase.execute(dto),
      onLoading: () => state.copyWith(
        isLoading: true,
        errorMessage: null,
        isSuccess: false,
        isValidateApi: false,
      ),
      onSuccess: (result) {
        return state.copyWith(
          isSuccess: false,
          isLoading: false,
          isValidateApi: true,
        );
      },
      onError: (error) {
        return handleError<AddProductState>(
          error,
          (message, _) {
            return state.copyWith(errorMessage: message, isLoading: false);
          },
        );
      },
    );
  }

  void selectProductType(ItemType type) async {
    state = state.copyWith(
      type: type,
      hasProductTypeSelected: true,
    );
  }

  void onModelChange(String value) {
    final isError = value.length > 3 ? null : "Modelo inválido";
    state = state.copyWith(
      model: value,
      errorModel: isError,
    );

    _checkStepProductInfoDetailsIsValid();
  }

  void onLicencePlateChange(String value) {
    final isError = value.length > 5 ? null : "Placa inválida";
    state = state.copyWith(
      licencePlate: value,
      errorLicencePlate: isError,
    );

    _checkStepProductInfoDetailsIsValid();
  }

  void onImeiChange(String value) {
    final isError = value.length < 15 ? "IMEI inválido" : null;
    state = state.copyWith(
      licencePlate: value,
      errorLicencePlate: isError,
      year: DateTime.now().year,
    );

    _checkStepProductInfoDetailsIsValid();
  }

  void onYearChange(String value) {
    final year = int.tryParse(value) ?? 0;
    final isValid = year >= 1900 && year <= DateTime.now().year + 1;
    final isError = isValid ? null : "Ano inválido";
    state = state.copyWith(
      year: year,
      errorYear: isError,
    );

    _checkStepProductInfoDetailsIsValid();
  }

  void onBrandChange(String value) {
    state = state.copyWith(
      brand: value,
    );

    _checkStepProductInfoDetailsIsValid();
  }

  void onColorChange(String value) {
    state = state.copyWith(color: value);

    _checkStepProductInfoDetailsIsValid();
  }

  void onObsChange(String value) {
    state = state.copyWith(
      obs: value,
    );
  }

  void addPhoto(ImageMedia image) {
    final newImages = List<ImageMedia>.from(state.imageMedia);
    newImages.add(image);
    state = state.copyWith(
      imageMedia: newImages,
      stepAddPhotoValid: (image.value.isNotEmpty),
    );
  }

  void removePhoto(int index) {
    final newImages = List<ImageMedia>.from(state.imageMedia);
    if (index >= 0 && index < newImages.length) {
      newImages.removeAt(index);

      state = state.copyWith(
        imageMedia: newImages,
        stepAddPhotoValid: newImages.isNotEmpty,
      );
    }
  }

  void nextStep(int steper) {
    final currentStep = steper + 1;
    state = state.copyWith(currentStep: currentStep);
  }

  void previous(int steper) {
    final currentStep = steper - 1;
    state = state.copyWith(currentStep: currentStep);
  }

  void _checkStepProductInfoDetailsIsValid() {
    final bool areFieldsFilled = (state.model?.isNotEmpty ?? false) &&
        (state.brand?.isNotEmpty ?? false) &&
        (state.year != null && state.year! > 0) &&
        (state.color?.isNotEmpty ?? false) &&
        (state.licencePlate?.isNotEmpty ?? false);

    final bool noValidationErrors = state.errorModel == null &&
        state.errorLicencePlate == null &&
        state.errorYear == null;

    final isValid = areFieldsFilled && noValidationErrors;

    state = state.copyWith(stepAddProductInfoDetailValid: isValid);
  }
}
