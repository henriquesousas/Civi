import 'package:deehelp/old_core/valueobject/value_object.dart';

class Name extends ValueObject<String> {
  static const int _minLength = 2;
  static const int _maxLength = 50;

  static final RegExp _nameRegex = RegExp(r'[^a-zA-Z0-9\s]');

  Name(super.value);

  factory Name.from(String value) {
    return Name(value);
  }

  @override
  void validate(String value) {
    final sanitizedValue = value.trim();

    if (sanitizedValue.length < _minLength ||
        sanitizedValue.length > _maxLength) {
      notification.add("name",
          'O nome deve ter entre $_minLength e $_maxLength caracteres.');
    }

    if (_nameRegex.hasMatch(sanitizedValue)) {
      notification.add("name",
          'O nome contém caracteres inválidos. Apenas letras e espaços são permitidos.');
    }
  }
}
