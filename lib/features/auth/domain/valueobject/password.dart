import 'package:yousafe/core/domain/valueobjects/value_object.dart';

class Password extends ValueObject<String> {
  static const _minLength = 3;
  static const _maxLength = 10;

  Password._(super.value);

  factory Password.from(String value) {
    return Password._(value);
  }

  @override
  void validate(String value) {
    final sanitizedValue = value.trim();

    if (sanitizedValue.length < _minLength ||
        sanitizedValue.length > _maxLength) {
      notification.add("password",
          'A senha deve ter entre $_minLength e $_maxLength caracteres.');
    }
  }
}
