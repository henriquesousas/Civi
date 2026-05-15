import 'package:deehelp/business/_shared/value_objects/exports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Phone ValueObject", () {
    test("givenCorrectPhoneNumber_whenCreate_shouldReturnCorrectValue", () {
      final expectedValue = "11955424445";
      final sut = Phone.create(expectedValue);
      expect(sut.hasError, isFalse);
      expect(sut.value, equals(expectedValue));
    });

    test("givenAnInvalidPhoneNumber_whenCreate_shouldReturnNotificationError",
        () {
      final expectedError = "Telefone inválido";
      final sut = Phone.create("1195542444578787");
      expect(sut.hasError, isTrue);
      expect(sut.errors.map((e) => e.message).toList(), [expectedError]);
    });
  });
}
