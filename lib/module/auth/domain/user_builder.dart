import 'package:deehelp/business/_shared/value_objects/email.dart';
import 'package:deehelp/old_core/valueobject/image_url.dart';
import 'package:deehelp/module/auth/domain/user.dart';
import 'package:deehelp/module/auth/domain/gender.dart';
import 'package:deehelp/module/auth/domain/status.dart';
import 'package:deehelp/business/_shared/value_objects/name.dart';
import 'package:deehelp/module/auth/domain/valueobject/user_id.dart';

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
    throw Exception("UserBuilder is not implemented yet");
    // return User(
    //   userId: userId != null ? UserId.from(userId!) : UserId.unique(),
    //   name: Name.create(name),
    //   email: Email.create(value: email),
    //   status: status ?? Status.pending,
    //   photoUrl: photoUrl != null ? ImageUrl.create(value: photoUrl!) : null,
    //   createdAt: createdAt ?? DateTime.now(),
    //   deletedAt: deletedAt,
    // );
  }
}
