import 'package:deehelp/business/_shared/value_objects/value_object.dart';

class Name extends ValueObject<String> {
  static const int _minLength = 2;
  static const int _maxLength = 30;

  static final RegExp _nameRegex = RegExp(r'[^a-zA-Z0-9\s]');

  Name._(super.value);

  factory Name.create(String value) {
    return Name._(value);
  }

  @override
  void validate(String value) {
    final sanitizedValue = value.trim();

    if (sanitizedValue.length < _minLength ||
        sanitizedValue.length > _maxLength) {
      addError(
          "name", 'Nome deve ter entre $_minLength e $_maxLength caracteres.');
    }

    if (_nameRegex.hasMatch(sanitizedValue)) {
      addError("name",
          'Nome contém caracteres inválidos. Apenas letras e espaços são permitidos.');
    }
  }
}
