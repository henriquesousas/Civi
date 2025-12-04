import 'package:deehelp/features/my_products/domain/entities/item_product.dart';
import 'package:deehelp/features/my_products/view/create/state/create_product_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/resources.dart';
import '../../domain/usecases/create/create_product_usecase.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  final CreateProductUseCase _createProductUseCase;
  int currentStep = 0;
  CreateProductCubit({required CreateProductUseCase usecase})
      : _createProductUseCase = usecase,
        super(const CreateProductState.initial());

  Future<void> loadTypes() async {
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

  Future<void> selectType(ItemProduct itemSelected) async {
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
    _updateState(
      value,
      (v) => v.length > 3 ? null : R.strings.errorMessageModel,
      (currentState, value, error) =>
          currentState.copyWith(model: value, errorModel: error),
    );
  }

  void onLicencePlateChange(String value) {
    _updateState(
      value,
      (v) => value.length > 5 ? null : R.strings.errorMessageVehicle,
      (currentState, value, error) =>
          currentState.copyWith(licencePlate: value, errorLicencePlate: error),
    );
  }

  void onYearChange(String value) {
    final year = int.tryParse(value) ?? 0;
    _updateState(
      year,
      (v) {
        final isValid = year >= 1900 && year <= DateTime.now().year + 1;
        return isValid ? null : R.strings.errorMessageYear;
      },
      (currentState, value, error) =>
          currentState.copyWith(year: value, errorYear: error),
    );
  }

  void onBrandChange(String value) {
    _updateState(
      value,
      (v) => null,
      (currentState, value, error) => currentState.copyWith(brand: value),
    );
  }

  void onColorChange(String value) {
    _updateState(
      value,
      (v) => null,
      (currentState, value, error) => currentState.copyWith(color: value),
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

  void _updateState<T>(
    T value,
    String? Function(T) validate,
    CreateProductState Function(Data state, T value, String? error) update,
  ) {
    final error = validate(value);
    state.maybeMap(
      data: (currentState) {
        emit(update(currentState, value, error));
      },
      orElse: () => null,
    );
  }
}
