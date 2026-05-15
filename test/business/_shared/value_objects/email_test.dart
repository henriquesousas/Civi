import 'package:deehelp/business/_shared/value_objects/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Email ValueObject", () {
    test("givenAnCorrectEmail_whenCreate_shouldReturnCorrectValue", () {
      final expectedValue = "any@mail.com";
      final sut = Email.create(expectedValue);

      expect(sut.hasError, isFalse);
      expect(sut.value, equals(expectedValue));
    });

    test("givenAnInvalidEmail_whenCreate_shouldReturnNotificationError", () {
      final expectedError = "Email inválido";
      final sut = Email.create("any");
      expect(sut.hasError, isTrue);
      expect(sut.errors.map((e) => e.message).toList(), [expectedError]);
    });
  });
}
