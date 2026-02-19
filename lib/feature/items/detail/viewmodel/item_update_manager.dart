import 'package:deehelp/module/item/domain/entities/product.dart';

// enum ProductField {
//   model,
//   obs,
//   description,
//   brand,
//   color,
//   code,
//   name,
//   type,
//   year,
// }

enum ItemField {
  model,
  obs,
  name,
  brand,
  color,
  year,
  code,
  notes,
}

class ItemUpdateManager {
  final Map<String, Product Function(Product, String)> _updaters = {};
  final Map<String, String? Function(String)> _validators = {};

  ItemUpdateManager() {
    _registerDefaults();
  }

  void _registerDefaults() {
    // Registrar updaters
    registerUpdater(
      ItemField.model,
      (product, value) => product.changeModel(value),
    );
    registerUpdater(
      ItemField.obs,
      (product, value) => product.changeObs(value),
    );
    registerUpdater(
      ItemField.brand,
      (product, value) => product.changeBrand(value),
    );
    registerUpdater(
      ItemField.color,
      (product, value) => product.changeColor(value),
    );
    registerUpdater(
      ItemField.name,
      (product, value) => product.changeName(value),
    );

    registerUpdater(
      ItemField.code,
      (product, value) => product.changeCode(value),
    );

    // Registrar validators
    registerValidator(
      ItemField.model,
      (value) => value.length > 3 ? null : 'Modelo inválido',
    );
    registerValidator(
      ItemField.name,
      (value) => value.length < 3 ? 'Nome inválido' : null,
    );
    registerValidator(
      ItemField.obs,
      (value) => value.length <= 500 ? null : 'Máximo 500 caracteres',
    );
    registerValidator(
      ItemField.code,
      _validateLicensePlate,
    );
  }

  void registerUpdater(
    ItemField field,
    Product Function(Product, String) updater,
  ) {
    _updaters[field.name] = updater;
  }

  void registerValidator(
    ItemField field,
    String? Function(String) validator,
  ) {
    _validators[field.name] = validator;
  }

  String? validateField(ItemField field, String value) {
    final validator = _validators[field.name];
    return validator?.call(value);
  }

  Product? updateField({
    required Product product,
    required ItemField field,
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
