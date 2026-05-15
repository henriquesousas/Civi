import 'package:deehelp/business/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('User should be created successfully', () {
    final expectedName = 'John Doe';
    final expectedNickname = 'John123';
    final expectedEmail = 'john.doe@example.com';

    final user = User.create(
      expectedName,
      expectedNickname,
      expectedEmail,
    );

    expect(user.name.value, equals(expectedName));
    expect(user.nickname.value, equals(expectedNickname));
    expect(user.email.value, equals(expectedEmail));
    expect(user.isActive, isTrue);
    expect(user.isAdmin, isFalse);
    expect(user.isVerified, isFalse);
    expect(user.phone, isNull);
    expect(user.photo, isNull);
    expect(user.bio, isNull);
    expect(user.createdAt, isNotNull);
  });
}
