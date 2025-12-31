import 'package:deehelp/features/products/domain/entities/image_media.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/views/add/state/add_product_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_update_state.freezed.dart';

@freezed
abstract class ProductUpdateState with _$ProductUpdateState {
  const factory ProductUpdateState({
    ProductType? productType,
    String? model,
    String? errorModel,
    String? licencePlate,
    String? errorLicencePlate,
    int? year,
    String? errorYear,
    String? brand,
    String? color,
    String? obs,
    @Default([]) List<ImageMedia> imageMedia,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _ProductUpdateState;

  factory ProductUpdateState.initial() => const ProductUpdateState();
  factory ProductUpdateState.setup(Product product) => ProductUpdateState(
        productType: ProductType.values.firstWhere(
          (e) => e.name == product.type,
        ),
        model: product.name,
        brand: product.brand,
        licencePlate: product.code,
        year: product.year,
        color: product.color,
        obs: product.obs,
        imageMedia: product.images,
      );
}
