import '../../../../core/domain/valueobject/value_object.dart';

class SurName extends ValueObject<String> {
  static const int _minLength = 2;
  static const int _maxLength = 50;

  static final RegExp _nameRegex = RegExp(r'[^a-zA-Z0-9\s]');

  SurName(super.value);

  factory SurName.from(String value) {
    return SurName(value);
  }

  @override
  void validate(String value) {
    final sanitizedValue = value.trim();

    if (sanitizedValue.length < _minLength ||
        sanitizedValue.length > _maxLength) {
      notification.add("name",
          'Campo sobrenome deve ter entre $_minLength e $_maxLength caracteres.');
    }

    if (_nameRegex.hasMatch(sanitizedValue)) {
      notification.add("name",
          'Campo sobrenome contém caracteres inválidos. Apenas letras e espaços são permitidos.');
    }
  }
}
