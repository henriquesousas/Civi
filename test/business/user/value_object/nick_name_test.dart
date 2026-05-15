import 'package:deehelp/business/user/value_objects/nickname.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("GivenAnValidNickname_WhenCreated_ThenShouldNotHaveErrors", () {
    final sut = NickName.create("any_nickname");
    expect(sut.hasError, isFalse);
    expect(sut.value, "any_nickname");
  });

  test("GivenAnEmptyNickname_WhenCreated_ThenShouldReturnErrors", () {
    final sut = NickName.create("any");
    expect(sut.hasError, isTrue);
  });

  test("GivenCount_WhenRandom_ThenShouldNicknames", () {
    final sut = NickName.random(2);
    expect(sut.length, equals(2));
    expect(sut[0].hasError, isFalse);
    expect(sut[1].hasError, isFalse);
  });
}
