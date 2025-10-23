import 'package:yousafe/core/domain/valueobjects/value_object.dart';

class Email extends ValueObject {
  final String _value;

  Email._({required String value}) : _value = value;

  factory Email.create({required String value}) {
    return Email._(value: value);
  }

  @override
  void validate(value) {
    final bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!isValid) {
      notification.add("email", "Email inválido");
    }
  }

  @override
  String get value => _value;

  @override
  List<Object?> get props => [value];
}
