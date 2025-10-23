import 'package:flutter_test/flutter_test.dart';
import 'package:yousafe/core/domain/notification/domain_notification.dart';

void main() {
  test("givenSingleNotificationMessage_whenCallAdd_shouldReturnCorrectValues",
      () {
    final expectedError = "any_error";
    final expectedErrorLength = 1;

    final sut = DomainNotification();
    sut.add("any", expectedError);

    expect(sut.hasErrors, isTrue);
    expect(sut.getErrors.length, equals(expectedErrorLength));
    expect(sut.getErrors.first, expectedError);
  });

  test("givenListNotificationMessage_whenCallAdd_shouldReturnCorrectValues",
      () {
    final expectedErrors = ["any_error1", "any_error2"];
    final expectedErrorLength = 2;

    final sut = DomainNotification();
    sut.add("any_1", expectedErrors[0]);
    sut.add("any_2", expectedErrors[1]);

    expect(sut.hasErrors, isTrue);
    expect(sut.getErrors.length, equals(expectedErrorLength));
    expect(sut.getErrors, expectedErrors);
  });

  test("givenDomainNotification_whenCallCopy_shouldCopyAllValues", () {
    final expectedErrors = ["any_error1", "any_error2"];
    final expectedErrorLength = 2;

    final domainNotification = DomainNotification();
    domainNotification.add("any_1", expectedErrors[0]);
    domainNotification.add("any_2", expectedErrors[1]);

    final sut = DomainNotification();
    sut.copy(domainNotification);

    expect(sut.hasErrors, isTrue);
    expect(sut.getErrors.length, equals(expectedErrorLength));
    expect(sut.getErrors, expectedErrors);
  });

  test(
      "givenNotificationMessageWithSameProperty_whenAdd_shouldReturnNotDuplicateErrors",
      () {
    final expectedErrorLength = 1;

    final sut = DomainNotification();
    sut.add("any", "any");
    sut.add("any", "any");

    expect(sut.hasErrors, isTrue);
    expect(sut.getErrors.length, equals(expectedErrorLength));
    expect(sut.getErrors, ["any"]);
  });
}
