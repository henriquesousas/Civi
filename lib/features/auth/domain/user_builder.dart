import 'package:deehelp/core/domain/valueobject/email.dart';
import 'package:deehelp/core/domain/valueobject/image_url.dart';
import 'package:deehelp/core/domain/valueobject/phone.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';
import 'package:deehelp/features/auth/domain/gender.dart';
import 'package:deehelp/features/auth/domain/status.dart';
import 'package:deehelp/features/auth/domain/valueobject/name.dart';
import 'package:deehelp/features/auth/domain/valueobject/password.dart';
import 'package:deehelp/features/auth/domain/valueobject/sur_name.dart';
import 'package:deehelp/features/auth/domain/valueobject/user_id.dart';

class UserBuilder {
  String name;
  String surName;
  String email;
  String phone;
  String password;
  Gender? gender;
  Status? status;
  String? googleId;
  String? userId;
  String? photoUrl;
  DateTime? createdAt;
  DateTime? deletedAt;

  UserBuilder({
    required this.name,
    required this.surName,
    required this.email,
    required this.phone,
    required this.password,
    required this.gender,
  });

  UserBuilder withUserId(String userId) {
    this.userId = userId;
    return this;
  }

  UserBuilder withDeletedAt(DateTime deletedAt) {
    this.deletedAt = deletedAt;
    return this;
  }

  UserBuilder withCreatedAt(DateTime createdAt) {
    this.createdAt = createdAt;
    return this;
  }

  UserBuilder withStatus(Status status) {
    this.status = status;
    return this;
  }

  UserBuilder withGoogleId(String googleId) {
    this.googleId = googleId;
    return this;
  }

  UserBuilder withPhotoUrl(String photoUrl) {
    this.photoUrl = photoUrl;
    return this;
  }

  User build() {
    return User(
      userId: userId != null ? UserId.from(userId!) : UserId.unique(),
      name: Name.from(name),
      surName: SurName.from(surName),
      gender: gender,
      email: Email.create(value: email),
      phone: Phone.create(value: phone),
      password: Password.from(password),
      status: status ?? Status.pending,
      googleId: googleId,
      photoUrl: photoUrl != null ? ImageUrl.create(value: photoUrl!) : null,
      createdAt: createdAt ?? DateTime.now(),
      deletedAt: deletedAt,
    );
  }
}
