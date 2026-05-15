import 'package:deehelp/business/_shared/value_objects/exports.dart';

class Bio extends ValueObject<String> {
  static const int _minLength = 2;
  static const int _maxLength = 50;

  Bio._(super.value);

  factory Bio.create(String value) {
    return Bio._(value);
  }

  @override
  void validate(String value) {
    final sanitizedValue = value.trim();

    if (sanitizedValue.length < _minLength ||
        sanitizedValue.length > _maxLength) {
      addError("name",
          'Missao deve ter entre $_minLength e $_maxLength caracteres.');
    }
  }
}
