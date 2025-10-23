import 'package:yousafe/core/domain/utils/id_utils.dart';
import 'package:yousafe/core/domain/valueobjects/value_object.dart';

class Identifier extends ValueObject<String> {
  static const _maxLength = 32;

  Identifier(super.value);

  factory Identifier.from(String value) {
    return Identifier(value);
  }

  factory Identifier.create() {
    return Identifier(IdUtils.generate());
  }

  @override
  void validate(value) {
    if (value.length != _maxLength) {
      notification.add("Id", "ID informado não é um UUID válido");
    }
  }
}
