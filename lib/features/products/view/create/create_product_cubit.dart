import 'package:dartz/dartz.dart';
import 'package:deehelp/core/utils/command_cubit.dart';
import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/item_product.dart';
import 'package:deehelp/features/products/view/create/state/create_product_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/assets/resources.dart';
import '../../domain/usecases/dtos/create_product_dto.dart';
import '../../domain/usecases/create_product_usecase.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  final CreateProductUseCase _createProductUseCase;
  int currentStep = 0;

  CreateProductCubit({required CreateProductUseCase usecase})
      : _createProductUseCase = usecase,
        super(const CreateProductState.initial());

  void loadTypes() async {
    final vehiclesTypes = [
      ItemProduct(
        isSelected: false,
        description: 'Veículos leves',
        srcImage: R.images.svgIconCon,
        identifier: 0,
      ),
      ItemProduct(
        isSelected: false,
        description: 'Veículos pesados',
        srcImage: R.images.svgIconTruck,
        identifier: 0,
      ),
      ItemProduct(
        isSelected: false,
        description: 'Veículos de duas rodas',
        srcImage: R.images.svgIconMotorcycle,
        identifier: 1,
      )
    ];

    state.maybeMap(
      data: (currentState) {
        emit(currentState.copyWith(items: currentState.items));
      },
      orElse: () => emit(CreateProductState.data(items: vehiclesTypes)),
    );
  }

  void selectType(ItemProduct itemSelected) async {
    final currentTypes = state.maybeMap(
      data: (state) => state.items,
      orElse: () => <ItemProduct>[],
    );

    if (currentTypes.isEmpty) return;
    final updatedItems = currentTypes.map((type) {
      final bool isThisSelected = type.description == itemSelected.description;
      return type.copyWith(isSelected: isThisSelected);
    }).toList();

    emit(CreateProductState.data(items: updatedItems, hasItemSelected: true));
  }

  void onModelChange(String value) {
    final isError = value.length > 3 ? null : "Modelo inválido";
    _updateDataState(
      (data) => data.copyWith(
        model: value,
        errorModel: isError,
      ),
    );
  }

  void onLicencePlateChange(String value) {
    final isError = value.length > 5 ? null : "Placa inválida";
    _updateDataState(
      (data) => data.copyWith(
        licencePlate: value,
        errorLicencePlate: isError,
      ),
    );
  }

  void onYearChange(String value) {
    final year = int.tryParse(value) ?? 0;
    final isValid = year >= 1900 && year <= DateTime.now().year + 1;
    final isError = isValid ? null : "Ano inválido";
    _updateDataState(
      (data) => data.copyWith(
        year: year,
        errorYear: isError,
      ),
    );
  }

  void onBrandChange(String value) {
    _updateDataState(
      (data) => data.copyWith(brand: value),
    );
  }

  void onColorChange(String value) {
    _updateDataState(
      (data) => data.copyWith(color: value),
    );
  }

  void onObsChange(String value) {
    _updateDataState(
      (data) => data.copyWith(
        obs: value,
      ),
    );
  }

  void addPhoto(ImageMedia image) {
    _updateDataState(
      (data) => data.copyWith(imageMedia: image),
    );
  }

  void nextStep(int steper) {
    state.maybeMap(
      data: (currentState) {
        final currentStep = steper + 1;
        emit(currentState.copyWith(currentStep: currentStep));
      },
      orElse: () => 0,
    );
  }

  void previous(int steper) {
    state.maybeMap(
      data: (currentState) {
        final currentStep = steper - 1;
        emit(currentState.copyWith(currentStep: currentStep));
      },
      orElse: () => null,
    );
  }

  void _updateDataState(DataUpdater updater) {
    state.maybeMap(
      data: (currentState) {
        final newData = updater(currentState);
        final bool stepAddoProductInfoDetailValid =
            _calculateStepAddProductInfoDetailValidity(newData);

        final bool stepAddPhotoValid = _calculateStepAddPhotoValidity(newData);

        final newState = newData.copyWith(
          stepAddProductInfoDetailValid: stepAddoProductInfoDetailValid,
          stepAddPhotoValid: stepAddPhotoValid,
        );
        emit(newState);
      },
      orElse: () {},
    );
  }

  void save() {
    // state.maybeMap(
    //   data: (data) async {
    //     final selectedItem =
    //         data.items.where((el) => el.isSelected == true).first;

    //     final dto = CreateProductDto(
    //       userId: FirebaseAuth.instance.currentUser!.uid,
    //       name: data.model!,
    //       year: data.year!,
    //       type: selectedItem.description,
    //       image: data.imageMedia!,
    //       code: data.licencePlate!,
    //       color: data.color!,
    //       brand: data.brand!,
    //       obs: data.obs,
    //     );

    //     await CommandCubit.execute<Unit, CreateProductState>(
    //       emit: emit,
    //       command: () => _createProductUseCase.execute(dto),
    //       onLoading: () {
    //         return data.copyWith(isLoading: true);
    //       },
    //       onSuccess: (result) {
    //         return data.copyWith(isSuccess: true);
    //       },
    //       onError: (error) {
    //         return data.copyWith(
    //           errorMessage: error.message,
    //           isLoading: false,
    //         );
    //       },
    //     );
    //   },
    //   orElse: () {},
    // );
  }

  bool _calculateStepAddProductInfoDetailValidity(
      CreateProductState stateToValidate) {
    return stateToValidate.maybeMap(
      data: (data) {
        final bool areFieldsFilled = (data.model?.isNotEmpty ?? false) &&
            (data.brand?.isNotEmpty ?? false) &&
            (data.year != null && data.year! > 0) &&
            (data.color?.isNotEmpty ?? false) &&
            (data.licencePlate?.isNotEmpty ?? false);

        final bool noValidationErrors = data.errorModel == null &&
            data.errorLicencePlate == null &&
            data.errorYear == null;

        return areFieldsFilled && noValidationErrors;
      },
      orElse: () => false,
    );
  }

  bool _calculateStepAddPhotoValidity(CreateProductState stateToValidate) {
    return stateToValidate.maybeMap(
      data: (data) => (data.imageMedia?.value.isNotEmpty ?? false),
      orElse: () => false,
    );
  }
}
