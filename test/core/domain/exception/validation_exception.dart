import 'package:flutter_test/flutter_test.dart';
import 'package:yousafe/core/domain/exception/validation_exception.dart';

void main() {
  test("givenAValidationException_wheCreateInstace_shouldReturnCorrectValues",
      () {
    final result = ValidationException(errors: ["any error"]);
    expect(result.errors, equals(["any error"]));
    expect(result.timestamp, isNotNull);
    expect(result.code, equals("400"));
  });
}
