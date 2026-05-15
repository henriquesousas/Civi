import 'package:deehelp/business/_shared/value_objects/exports.dart';
import 'package:deehelp/business/_shared/utils/id_utils.dart';

class UniqueId extends ValueObject<String> {
  UniqueId._(super.value);

  factory UniqueId.create(String value) {
    return UniqueId._(value);
  }

  factory UniqueId.unique() {
    return UniqueId._(IdUtils.generate());
  }

  @override
  void validate(String value) {
    if (!IdUtils.isValid(value)) {
      addError("Id", "Id inválido");
    }
  }
}
