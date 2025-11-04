import 'package:deehelp/features/auth/domain/user_builder.dart';

import '../domain/entity/user.dart';

class UserModel {
  static Map<String, dynamic> toMap(User user) {
    return {
      'id': user.id.value,
      'name': user.name.value,
      'email': user.email.value,
      'status': user.status?.name,
      'imageUrl': user.photoUrl?.value,
      'createdAt': user.createdAt,
      'deletedAt': user.deletedAt,
    };
  }

  static User toUser(Map<String, dynamic> map) {
    return UserBuilder(
      name: map['name'],
      email: map['email'],
    ).withUserId(map['id']).build();
  }
}
