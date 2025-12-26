import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/item_product.dart';
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
    // Step 0
    String? model,
    String? errorModel,
    String? licencePlate,
    String? errorLicencePlate,
    int? year,
    String? errorYear,
    String? brand,
    String? color,
    bool? stepAddProductInfoDetailValid,
    // Step 2
    String? obs,
    // Step 2
    ImageMedia? imageMedia,
    @Default(false) bool stepAddPhotoValid,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _Data;
}
