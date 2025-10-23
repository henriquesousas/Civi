import 'package:yousafe/core/domain/entity.dart';
import 'package:yousafe/core/domain/validation_handler.dart';
import 'package:yousafe/core/domain/valueobjects/email.dart';
import 'package:yousafe/core/domain/valueobjects/image_url.dart';
import 'package:yousafe/core/domain/valueobjects/phone.dart';
import 'package:yousafe/features/auth/domain/name.dart';
import 'package:yousafe/features/auth/domain/password.dart';
import 'package:yousafe/features/auth/domain/status.dart';
import 'package:yousafe/features/auth/domain/sur_name.dart';
import 'package:yousafe/features/auth/domain/user_id.dart';
import 'package:yousafe/features/auth/domain/user_validator.dart';

import 'gender.dart';

class User extends Entity<UserId> {
  final Name name;
  final SurName surName;
  final Gender gender;
  final Email email;
  final Phone phone;
  final Password password;
  final UserId userId;
  final Status? status;
  final ImageUrl? photoUrl;
  final String? googleId;
  final DateTime createdAt;
  final DateTime? deletedAt;

  User({
    required this.userId,
    required this.name,
    required this.surName,
    required this.gender,
    required this.email,
    required this.phone,
    required this.password,
    required this.createdAt,
    this.status,
    this.photoUrl,
    this.googleId,
    this.deletedAt,
  }) : super(userId) {
    validate(notification);
  }

  @override
  void validate(final ValidationHandler handler) {
    UserValidator(user: this, handler: handler).validate();
  }
}
