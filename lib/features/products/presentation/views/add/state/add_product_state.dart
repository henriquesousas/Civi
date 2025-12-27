import 'package:deehelp/core/ui/assets/resources.dart';
import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_state.freezed.dart';

List<ProductType> getDefaultProductTypes() {
  return [
    ProductType(
      isSelected: false,
      description: 'Veículos leves',
      srcImage: R.images.svgIconCon,
      identifier: 0,
    ),
    ProductType(
      isSelected: false,
      description: 'Veículos pesados',
      srcImage: R.images.svgIconTruck,
      identifier: 0,
    ),
    ProductType(
      isSelected: false,
      description: 'Veículos de duas rodas',
      srcImage: R.images.svgIconMotorcycle,
      identifier: 1,
    )
  ];
}

@freezed
abstract class AddProductState with _$AddProductState {
  const factory AddProductState({
    @Default(0) int currentStep,
    @Default([]) List<ProductType> productTypes,
    @Default(false) bool hasProductTypeSelected,
    // Step 1
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
    // Step 3
    ImageMedia? imageMedia,
    @Default(false) bool stepAddPhotoValid,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _AddProductState;

  factory AddProductState.initial() => AddProductState(
        productTypes: getDefaultProductTypes(),
      );
}
