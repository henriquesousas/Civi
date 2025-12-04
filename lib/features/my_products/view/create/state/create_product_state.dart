import 'package:deehelp/features/my_products/domain/entities/item_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_state.freezed.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = _Initial;

  // const factory CreateProductState.loadProductTypes(
  //   List<ItemProduct> itemTypes,
  //   bool enableButton,
  // ) = _LoadProductTypes;

  // const factory CreateProductState.onFormProductDetailChangeValues({
  //   String? model,
  //   String? licencePlate,
  //   String? errorModel,
  //   String? errorLicencePlate,
  //   @Default(false) bool called,
  // }) = _OnFormProductDetailChangeValues;

  const CreateProductState._();
  const factory CreateProductState.data({
    @Default(0) int currentStep,
    @Default([]) List<ItemProduct> items,
    @Default(false) bool hasItemSelected,
    // Step 1
    String? model,
    String? errorModel,
    String? licencePlate,
    String? errorLicencePlate,
    int? year,
    String? errorYear,
    String? brand,
    String? color,
    @Default(false) bool step1Valid,
    // Step 2
    @Default(false) bool step2Valid,
    // Step 3
    @Default(false) bool step3Valid,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = Data;
}
