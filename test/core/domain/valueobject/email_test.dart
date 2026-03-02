import 'package:deehelp/core/valueobject/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Email ValueObject", () {
    test("givenCorrectEmail_whenCreate_shouldReturnCorrectValue", () {
      final expectedValue = "any@mail.com";
      final sut = Email.create(value: expectedValue);
      expect(sut.notification.hasErrors, isFalse);
      expect(sut.value, equals(expectedValue));
    });

    test("givenAnInvalidEmail_whenCreate_shouldReturnNotificationError", () {
      final expectedError = "Email inválido";
      final sut = Email.create(value: "any");
      expect(sut.notification.hasErrors, isTrue);
      expect(sut.notification.getErrors, [expectedError]);
    });
  });
}
