import 'package:deehelp/business/_shared/value_objects/value_object.dart';

class Phone extends ValueObject<String> {
  static const _length = 11;
  Phone._(super.value);

  factory Phone.create(String value) {
    return Phone._(value);
  }

  @override
  void validate(String value) {
    if (value.length != _length) {
      addError("phone", "Telefone inválido");
    }
  }
}
