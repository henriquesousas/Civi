import 'package:flutter_test/flutter_test.dart';
import 'package:deehelp/business/_shared/domain_notification.dart';

void main() {
  test("givenSingleNotificationMessage_whenCallAdd_shouldReturnCorrectValues",
      () {
    final expectedError = "any_error";
    final expectedErrorLength = 1;

    final sut = DomainNotification();
    sut.append("any_field", expectedError);

    expect(sut.hasErrors, isTrue);
    expect(sut.getErrors.length, equals(expectedErrorLength));
    expect(sut.getErrors.first.message, expectedError);
  });

  test("givenListNotificationMessage_whenCallAdd_shouldReturnCorrectValues",
      () {
    final expectedErrors = ["any_error1", "any_error2"];
    final expectedErrorLength = 2;

    final sut = DomainNotification();
    sut.append("any_1", expectedErrors[0]);
    sut.append("any_2", expectedErrors[1]);

    expect(sut.hasErrors, isTrue);
    expect(sut.getErrors.length, equals(expectedErrorLength));
    expect(sut.getErrors.map((e) => e.message), expectedErrors);
  });

  test("givenDomainNotification_whenCallCopy_shouldCopyAllValues", () {
    final expectedErrors = ["any_error1", "any_error2"];
    final expectedErrorLength = 2;

    final domainNotification = DomainNotification();
    domainNotification.append("any_1", expectedErrors[0]);
    domainNotification.append("any_2", expectedErrors[1]);

    final sut = DomainNotification();
    sut.copy(domainNotification);

    expect(sut.hasErrors, isTrue);
    expect(sut.getErrors.length, equals(expectedErrorLength));
    expect(sut.getErrors.map((e) => e.message), expectedErrors);
  });

  test(
      "givenNotificationMessageWithSameProperty_whenAdd_shouldReturnNotDuplicateErrors",
      () {
    final expectedErrorLength = 1;

    final sut = DomainNotification();
    sut.append("any", "any");
    sut.append("any", "any");

    expect(sut.hasErrors, isTrue);
    expect(sut.getErrors.length, equals(expectedErrorLength));
    expect(sut.getErrors.map((e) => e.message), ["any"]);
  });
}
