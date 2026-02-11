import 'package:flutter_test/flutter_test.dart';
import 'package:deehelp/old_features/auth/domain/valueobject/name.dart';

void main() {
  group("Name ValueObject", () {
    test("givenCorrectName_whenCallFrom_shouldReturnCorrectValue", () {
      final expectedValue = "any name";
      final sut = Name.from(expectedValue);
      expect(sut.notification.hasErrors, isFalse);
      expect(sut.value, equals(expectedValue));
    });

    test(
        "givenAnNameLessThanMinLength_whenCallFrom_shouldReturnNotificationError",
        () {
      final minLength = 2;
      final maxLength = 50;
      final expectedError =
          "O nome deve ter entre $minLength e $maxLength caracteres.";
      final sut = Name.from("a");
      expect(sut.notification.hasErrors, isTrue);
      expect(sut.notification.getErrors, [expectedError]);
    });

    test(
        "givenAnNameGreaterThanMinLength_whenCallFrom_shouldReturnNotificationError",
        () {
      final minLength = 2;
      final maxLength = 50;
      final expectedError =
          "O nome deve ter entre $minLength e $maxLength caracteres.";

      List<String> value = List.generate(51, (index) => "a");
      final sut = Name.from(value.join());
      expect(sut.notification.hasErrors, isTrue);
      expect(sut.notification.getErrors, [expectedError]);
    });
  });
}
