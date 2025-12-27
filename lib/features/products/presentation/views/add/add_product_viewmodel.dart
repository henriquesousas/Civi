import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product_type.dart';
import 'package:deehelp/features/products/presentation/views/add/state/add_product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProductViewmodel extends StateNotifier<AddProductState> {
  AddProductViewmodel() : super(AddProductState.initial());

  void selectProductType(ProductType productType) async {
    if (state.productTypes.isEmpty) return;
    final updatedItems = state.productTypes.map((type) {
      final bool isThisSelected = type.description == productType.description;
      return type.copyWith(isSelected: isThisSelected);
    }).toList();

    state = state.copyWith(
      productTypes: updatedItems,
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
    state = state.copyWith(
      imageMedia: image,
      stepAddPhotoValid: (image.value.isNotEmpty),
    );
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

//   void save() {
//     // state.maybeMap(
//     //   data: (data) async {
//     //     final selectedItem =
//     //         data.items.where((el) => el.isSelected == true).first;

//     //     final dto = CreateProductDto(
//     //       userId: FirebaseAuth.instance.currentUser!.uid,
//     //       name: data.model!,
//     //       year: data.year!,
//     //       type: selectedItem.description,
//     //       image: data.imageMedia!,
//     //       code: data.licencePlate!,
//     //       color: data.color!,
//     //       brand: data.brand!,
//     //       obs: data.obs,
//     //     );

//     //     await CommandCubit.execute<Unit, CreateProductState>(
//     //       emit: emit,
//     //       command: () => _createProductUseCase.execute(dto),
//     //       onLoading: () {
//     //         return data.copyWith(isLoading: true);
//     //       },
//     //       onSuccess: (result) {
//     //         return data.copyWith(isSuccess: true);
//     //       },
//     //       onError: (error) {
//     //         return data.copyWith(
//     //           errorMessage: error.message,
//     //           isLoading: false,
//     //         );
//     //       },
//     //     );
//     //   },
//     //   orElse: () {},
//     // );
//   }
}
