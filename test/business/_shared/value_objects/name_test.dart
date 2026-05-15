import 'package:deehelp/business/_shared/value_objects/exports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Name ValueObject", () {
    final minLength = 2;
    final maxLength = 30;

    test("givenAnCorrectName_whenCreate_shouldReturnCorrectValue", () {
      final expectedValue = "any name";
      final sut = Name.create(expectedValue);
      expect(sut.hasError, isFalse);
      expect(sut.value, equals(expectedValue));
    });

    test(
        "givenAnNameLessThanMinLength_whenCreate_shouldReturnNotificationError",
        () {
      final expectedError =
          "Nome deve ter entre $minLength e $maxLength caracteres.";
      final sut = Name.create("a");
      expect(sut.hasError, isTrue);
      expect(sut.errors.map((e) => e.message).toList(), [expectedError]);
    });

    test(
        "givenAnNameGreaterThanMinLength_whenCreate_shouldReturnNotificationError",
        () {
      final expectedError =
          "Nome deve ter entre $minLength e $maxLength caracteres.";

      List<String> value = List.generate(51, (index) => "a");
      final sut = Name.create(value.join());
      expect(sut.hasError, isTrue);
      expect(sut.errors.map((e) => e.message).toList(), [expectedError]);
    });
  });
}
