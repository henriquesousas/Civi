import 'package:flutter_test/flutter_test.dart';
import 'package:yousafe/core/domain/utils/id_utils.dart';
import 'package:yousafe/features/auth/domain/gender.dart';
import 'package:yousafe/features/auth/domain/status.dart';
import 'package:yousafe/features/auth/domain/user_builder.dart';

void main() {
  test("givenAnUserDefaultValues_whenBuild_shouldReturnUser", () {
    final sut = UserBuilder(
      name: "any name",
      surName: "any surname",
      email: "any@gmail.com",
      phone: "11975454454",
      password: "any",
      gender: Gender.male,
    ).build();

    expect(sut.name.value, equals("any name"));
    expect(sut.surName.value, equals("any surname"));
    expect(sut.email.value, equals("any@gmail.com"));
    expect(sut.phone.value, equals("11975454454"));
    expect(sut.password.value, equals("any"));
    expect(sut.gender.name, equals("male"));
    expect(sut.status, equals(Status.pending));
    expect(sut.createdAt, isNotNull);
    expect(sut.userId.value.length, equals(32));
    expect(sut.deletedAt, isNull);
    expect(sut.googleId, isNull);
    expect(sut.photoUrl, isNull);
  });

  test("givenAllUserValues_whenBuild_shouldReturnUser", () {
    final expectedCreatedAt = DateTime.now();
    final expectedGoogleId = IdUtils.generate();
    final expectedUserId = IdUtils.generate();
    final expectedPhotoUrl = "https://any.png";
    final sut = UserBuilder(
      name: "any name",
      surName: "any surname",
      email: "any@gmail.com",
      phone: "11975454454",
      password: "any",
      gender: Gender.male,
    )
        .withCreatedAt(expectedCreatedAt)
        .withDeletedAt(expectedCreatedAt)
        .withGoogleId(expectedGoogleId)
        .withUserId(expectedUserId)
        .withPhotoUrl(expectedPhotoUrl)
        .withStatus(Status.active)
        .build();

    expect(sut.name.value, equals("any name"));
    expect(sut.surName.value, equals("any surname"));
    expect(sut.email.value, equals("any@gmail.com"));
    expect(sut.phone.value, equals("11975454454"));
    expect(sut.password.value, equals("any"));
    expect(sut.gender.name, equals("male"));
    expect(sut.status, equals(Status.active));
    expect(sut.createdAt, equals(expectedCreatedAt));
    expect(sut.userId.value, equals(expectedUserId));
    expect(sut.deletedAt, equals(expectedCreatedAt));
    expect(sut.googleId, equals(expectedGoogleId));
    expect(sut.photoUrl!.value, equals(expectedPhotoUrl));
  });

  test("givenAnUserWithValidationError_whenBuild_shouldNotifyError", () {
    final sut = UserBuilder(
      name: "a",
      surName: "a",
      email: "any",
      phone: "1",
      password: "a",
      gender: Gender.male,
    ).build();

    expect(sut.notification.hasErrors, isTrue);
    expect(sut.notification.getErrors.length, 5);
  });
}
