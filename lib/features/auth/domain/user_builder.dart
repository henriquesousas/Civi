import 'package:deehelp/core/valueobject/email.dart';
import 'package:deehelp/core/valueobject/image_url.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';
import 'package:deehelp/features/auth/domain/gender.dart';
import 'package:deehelp/features/auth/domain/status.dart';
import 'package:deehelp/features/auth/domain/valueobject/name.dart';
import 'package:deehelp/features/auth/domain/valueobject/user_id.dart';

class UserBuilder {
  String name;
  String email;
  String? surName;
  String? phone;
  String? password;
  Gender? gender;
  Status? status;
  String? googleId;
  String? userId;
  String? photoUrl;
  DateTime? createdAt;
  DateTime? deletedAt;

  UserBuilder({
    required this.name,
    required this.email,
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
      email: Email.create(value: email),
      status: status ?? Status.pending,
      photoUrl: photoUrl != null ? ImageUrl.create(value: photoUrl!) : null,
      createdAt: createdAt ?? DateTime.now(),
      deletedAt: deletedAt,
    );
  }
}
