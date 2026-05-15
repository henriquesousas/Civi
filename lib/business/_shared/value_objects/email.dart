import 'package:deehelp/business/_shared/value_objects/value_object.dart';

class Email extends ValueObject<String> {
  Email._(super.value);

  factory Email.create(String value) {
    return Email._(value);
  }

  @override
  void validate(String value) {
    final bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!isValid) {
      addError("email", "Email inválido");
    }
  }
}
