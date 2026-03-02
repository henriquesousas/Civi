import 'package:deehelp/old_core/utils/id_utils.dart';
import 'package:deehelp/old_core/valueobject/identifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Identifier ValueObject", () {
    test("givenCorrectIdentifier_whenCallFrom_shouldReturnCorrectValue", () {
      final expectedValue = IdUtils.generate();
      final sut = Identifier.from(expectedValue);
      expect(sut.notification.hasErrors, isFalse);
      expect(sut.value, equals(expectedValue));
    });

    test("givenCorrectIdentifier_whenCallCreate_shouldReturnCorrectValue", () {
      final sut = Identifier.create();
      expect(sut.notification.hasErrors, isFalse);
      expect(sut.value.length, equals(32));
    });

    test("givenAnInvalidUuid_whenCallFrom_shouldReturnNotificationError", () {
      final expectedError = "ID informado não é um UUID válido";
      final sut = Identifier.from("123456789112345678921423456875454545");
      expect(sut.notification.hasErrors, isTrue);
      expect(sut.notification.getErrors, [expectedError]);
    });

    test("givenAnEmptyUuid_whenCallFrom_shouldReturnNotificationError", () {
      final expectedError = "ID informado não é um UUID válido";
      final sut = Identifier.from("");
      expect(sut.notification.hasErrors, isTrue);
      expect(sut.notification.getErrors, [expectedError]);
    });
  });
}
