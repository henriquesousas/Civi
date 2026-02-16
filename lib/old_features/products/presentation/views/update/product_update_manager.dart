import 'package:deehelp/module/item/domain/entities/product.dart';

enum ProductField {
  model,
  obs,
  description,
  brand,
  color,
  code,
  name,
  type,
  year,
}

class ProductUpdateManager {
  final Map<String, Product Function(Product, String)> _updaters = {};
  final Map<String, String? Function(String)> _validators = {};

  ProductUpdateManager() {
    _registerDefaults();
  }

  void _registerDefaults() {
    // Registrar updaters
    registerUpdater(
        ProductField.model, (product, value) => product.changeModel(value));
    registerUpdater(
        ProductField.obs, (product, value) => product.changeObs(value));
    registerUpdater(
        ProductField.brand, (product, value) => product.changeBrand(value));
    registerUpdater(
        ProductField.color, (product, value) => product.changeColor(value));
    // registerUpdater('name', (product, value) => product.changeName(value));
    registerUpdater(
        ProductField.type, (product, value) => product.changeType(value));

    // Registrar validators
    registerValidator(ProductField.model,
        (value) => value.length > 3 ? null : 'Modelo inválido');
    registerValidator(ProductField.obs,
        (value) => value.length <= 500 ? null : 'Máximo 500 caracteres');
    registerValidator(ProductField.code, _validateLicensePlate);
  }

  void registerUpdater(
    ProductField field,
    Product Function(Product, String) updater,
  ) {
    _updaters[field.name] = updater;
  }

  void registerValidator(
    ProductField field,
    String? Function(String) validator,
  ) {
    _validators[field.name] = validator;
  }

  String? validateField(ProductField field, String value) {
    final validator = _validators[field.name];
    return validator?.call(value);
  }

  Product? updateField({
    required Product product,
    required ProductField field,
    required String value,
  }) {
    final updater = _updaters[field.name];
    if (updater == null) return null;

    return updater(product, value);
  }

  String? _validateLicensePlate(String plate) {
    if (plate.isEmpty) return 'Placa obrigatória';
    final regex = RegExp(r'^[A-Z]{3}[0-9][A-Z0-9][0-9]{2}$');
    return regex.hasMatch(plate.toUpperCase()) ? null : 'Placa inválida';
  }
}
