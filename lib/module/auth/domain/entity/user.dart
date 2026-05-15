import 'package:deehelp/core/base/entity.dart';
import 'package:deehelp/core/validation/validation_handler.dart';
import 'package:deehelp/business/_shared/value_objects/email.dart';
import 'package:deehelp/core/valueobject/image_url.dart';
import 'package:deehelp/module/auth/domain/status.dart';
import 'package:deehelp/module/auth/domain/user_validator.dart';
import 'package:deehelp/business/_shared/value_objects/name.dart';
import 'package:deehelp/module/auth/domain/valueobject/user_id.dart';

class User extends Entity<UserId> {
  final Name name;
  final Email email;
  final UserId userId;
  final Status? status;
  final ImageUrl? photoUrl;
  final DateTime? createdAt;
  final DateTime? deletedAt;

  User({
    required this.userId,
    required this.name,
    required this.email,
    this.createdAt,
    this.status,
    this.photoUrl,
    this.deletedAt,
  }) : super(userId) {
    validate(notification);
  }

  @override
  void validate(final ValidationHandler handler) {
    // UserValidator(user: this, handler: handler).validate();
  }
}
