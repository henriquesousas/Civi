import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_form_content.freezed.dart';

@freezed
class CreateProductFormContent with _$CreateProductFormContent {
  const factory CreateProductFormContent.initial() =
      _CreateProductFormContentInitial;
  const factory CreateProductFormContent.infoProduct({
    // Valores dos Campos
    @Default('') String productName,
    @Default('') String productModel,
    @Default('') String licensePlate, // Placa
    @Default(0) int year, // Ano

    // Erros dos Campos (usando String? para indicar ausência de erro com null)
    String? productNameError,
    String? productModelError,
    String? licensePlateError, // Erro da Placa
    String? yearError, // Erro do Ano

    @Default(false) bool isFormValid,
  }) = _CreateProductFormContentInfoProduct;
}
