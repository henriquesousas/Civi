import 'package:deehelp/core/image_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("givenAnValidUrl_whenCallExtractImagePath_shouldReturnImageName", () {
    final expectedName = "products/1763561068865.jpeg";
    final url =
        "https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev/products/1763561068865.jpeg";
    final imageName = ImageUtils.extractImagePath(url);
    expect(imageName, expectedName);
  });

  test("givenAnInValidUrl_whenCallExtractImagePath_shouldReturnNull", () {
    final url = "any";
    final imageName = ImageUtils.extractImagePath(url);

    expect(imageName, isNull);
  });
}
