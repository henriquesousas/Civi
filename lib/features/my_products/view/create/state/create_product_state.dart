import 'package:deehelp/features/my_products/domain/entities/item_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_state.freezed.dart';

// ignore: library_private_types_in_public_api
typedef DataUpdater = _Data Function(_Data currentData);

@freezed
class CreateProductState with _$CreateProductState {
  const CreateProductState._();

  const factory CreateProductState.initial() = _Initial;

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
    bool? step1Valid,
    // Step 2
    @Default(false) bool step2Valid,
    // Step 3
    @Default(false) bool step3Valid,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _Data;
}
