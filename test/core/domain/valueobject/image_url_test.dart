import 'package:deehelp/core/valueobject/image_url.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ImageUrl ValueObject", () {
    test("givenCorrectUrl_whenCreate_shouldReturnCorrectValue", () {
      final expectedValue = "http://any.png";
      final sut = ImageUrl.create(value: expectedValue);
      expect(sut.notification.hasErrors, isFalse);
      expect(sut.value, equals(expectedValue));
    });

    test("givenAnEmptyUrl_whenCreate_shouldReturnNotificationError", () {
      final expectedError = "URL da imagem não pode ser vazia.";
      final sut = ImageUrl.create(value: "");
      expect(sut.notification.hasErrors, isTrue);
      expect(sut.notification.getErrors, [expectedError]);
    });

    test("givenAnInvalidUrl_whenCreate_shouldReturnNotificationError", () {
      final expectedError = "O formato da URL não válida.";
      final sut = ImageUrl.create(value: "teste.png");
      expect(sut.notification.hasErrors, isTrue);
      expect(sut.notification.getErrors, [expectedError]);
    });

    test("givenAnInvalidUrlExtension_whenCreate_shouldReturnNotificationError",
        () {
      final expectedError = "A URL deve terminar com uma extensão permitida: ${[
        'png',
        'jpg',
        'jpeg'
      ].join(', ')}.";
      final sut = ImageUrl.create(value: "http://any_image.pdf");
      expect(sut.notification.hasErrors, isTrue);
      expect(sut.notification.getErrors, [expectedError]);
    });
  });
}
