import 'package:yousafe/core/domain/valueobjects/value_object.dart';

class Phone extends ValueObject {
  Phone._({required String value}) : super(value);

  factory Phone.create({required String value}) {
    return Phone._(value: value);
  }

  @override
  void validate(value) {
    if (value.length != 11) {
      notification.add("phone", "Telefone inválido");
    }
  }
}
