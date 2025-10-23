import 'package:equatable/equatable.dart';
import 'package:yousafe/core/domain/valueobjects/value_object.dart';

class Phone extends ValueObject with EquatableMixin {
  final String _value;

  Phone._({required String value}) : _value = value;

  factory Phone.create({required String value}) {
    return Phone._(value: value);
  }

  @override
  void validate(value) {
    if (value.length != 11) {
      notification.add("phone", "Telefone inválido");
    }
  }

  @override
  String get value => _value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => ' $value';
}
