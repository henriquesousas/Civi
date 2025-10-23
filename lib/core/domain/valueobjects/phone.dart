import 'package:yousafe/core/domain/valueobjects/value_object.dart';

class Phone extends ValueObject {
  static const _length = 11;
  Phone._({required String value}) : super(value);

  factory Phone.create({required String value}) {
    return Phone._(value: value);
  }

  @override
  void validate(value) {
    if (value.length != _length) {
      notification.add("phone", "Telefone inválido");
    }
  }
}
