import 'package:flutter_test/flutter_test.dart';
import 'package:yousafe/core/domain/valueobjects/phone.dart';

void main() {
  group("Phone ValueObject", () {
    test("givenCorrectPhoneNumber_whenCreate_shouldReturnCorrectValue", () {
      final expectedValue = "11955424445";
      final sut = Phone.create(value: expectedValue);
      expect(sut.notification.hasErrors, isFalse);
      expect(sut.value, equals(expectedValue));
    });

    test("givenAnInvalidPhoneNumber_whenCreate_shouldReturnNotificationError",
        () {
      final expectedError = "Telefone inválido";
      final sut = Phone.create(value: "1195542444578787");
      expect(sut.notification.hasErrors, isTrue);
      expect(sut.notification.getErrors, [expectedError]);
    });

    test("teste", () {
      final sut = Phone.create(value: "1972732245");
      final sut2 = Phone.create(value: "1972732245");

      final res = sut == sut2;
      print(res);
    });
  });
}
