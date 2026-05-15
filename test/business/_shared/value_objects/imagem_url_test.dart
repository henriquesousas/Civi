import 'package:deehelp/business/_shared/value_objects/exports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "givenAnValidUrlImage_whenCreate_shouldReturnCorrectValue",
    () {
      final url = "http://example.com/image.jpg";
      final sut = ImageUrl.create(url);
      expect(sut.hasError, false);
      expect(sut.value, url);
    },
  );

  test(
    "givenAnInValidUrlImage_whenCreate_shouldReturnCorrectValue",
    () {
      final url = "teste";
      final sut = ImageUrl.create(url);
      expect(sut.hasError, true);
      expect(sut.errors.map((e) => e.message).toList(),
          ["URL da imagem inválida"]);
    },
  );

  test(
    "givenAnEmptyUrlImage_whenCreate_shouldReturnCorrectValue",
    () {
      final sut = ImageUrl.create("");
      expect(sut.hasError, true);
      expect(sut.errors.map((e) => e.message).toList(),
          ["A imagem é obrigatória"]);
    },
  );

  test(
    "givenAnInvalidUrlExtension_whenCreate_shouldReturnCorrectValue",
    () {
      final sut = ImageUrl.create("http://example.com/image.txt");
      expect(sut.hasError, true);
      expect(sut.errors.map((e) => e.message).toList(),
          ["Formato de imagem inválido"]);
    },
  );
}
