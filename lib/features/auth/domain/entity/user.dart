import 'package:deehelp/core/domain/entity.dart';
import 'package:deehelp/core/domain/validation/validation_handler.dart';
import 'package:deehelp/core/domain/valueobject/email.dart';
import 'package:deehelp/core/domain/valueobject/image_url.dart';
import 'package:deehelp/core/domain/valueobject/phone.dart';
import 'package:deehelp/features/auth/domain/status.dart';
import 'package:deehelp/features/auth/domain/user_validator.dart';
import 'package:deehelp/features/auth/domain/valueobject/name.dart';
import 'package:deehelp/features/auth/domain/valueobject/password.dart';
import 'package:deehelp/features/auth/domain/valueobject/sur_name.dart';
import 'package:deehelp/features/auth/domain/valueobject/user_id.dart';

import '../gender.dart';

class User extends Entity<UserId> {
  final Name name;
  final SurName surName;
  final Email email;
  final Phone phone;
  final Password password;
  final UserId userId;
  final Gender? gender;
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
