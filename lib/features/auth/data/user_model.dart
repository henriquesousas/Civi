import 'package:deehelp/core/domain/extension/enum_extension.dart';
import 'package:deehelp/features/auth/domain/gender.dart';
import 'package:deehelp/features/auth/domain/user_builder.dart';

import '../domain/entity/user.dart';

class UserModel {
  static Map<String, dynamic> toMap(User user) {
    return {
      'id': user.id.value,
      'name': user.name.value,
      'surName': user.surName.value,
      'email': user.email.value,
      'phone': user.phone.value,
      'gender': user.gender?.name,
      'status': user.status?.name,
      'imageUrl': user.photoUrl?.value,
      'googleId': user.googleId,
      'createdAt': user.createdAt,
      'deletedAt': user.deletedAt,
    };
  }

  static User toUser(Map<String, dynamic> map) {
    return UserBuilder(
      name: map['name'],
      surName: map['surName'],
      email: map['email'],
      phone: map['phone'],
      password: "sasas",
      gender: map['gender'].toString().toEnum(Gender.values),
    ).withUserId(map['id']).build();
  }
}
