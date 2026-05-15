import 'package:deehelp/business/_shared/entity/exports.dart';
import 'package:deehelp/business/_shared/value_objects/exports.dart';
import 'package:deehelp/business/user/user_validator.dart';
import 'package:deehelp/business/user/value_objects/bio.dart';
import 'package:deehelp/business/user/value_objects/nickname.dart';
import 'package:deehelp/business/_shared/validation/validation_handler.dart';

class NullableUtils {
  static T? of<T, R>(
    R? value,
    T Function(R value) mapper,
  ) {
    if (value == null) {
      return null;
    }

    return mapper(value);
  }
}

class User extends Entity {
  final Name name;
  final NickName nickname;
  final Email email;
  Phone? phone;
  ImageUrl? photo;
  Bio? bio;
  bool isActive;
  bool isAdmin;
  bool isVerified;
  final DateTime createdAt;

  User._({
    required this.name,
    required this.nickname,
    required this.email,
    required this.isActive,
    required this.isAdmin,
    required this.isVerified,
    final DateTime? createdAt,
    this.phone,
    this.photo,
    this.bio,
  }) : createdAt = createdAt ?? DateTime.now() {
    validate(notification);
  }

  factory User.create(
    String name,
    String nickName,
    String email, {
    String? phone,
    String? photo,
    String? bio,
    DateTime? createdAt,
  }) {
    return User._(
      name: Name.create(name),
      nickname: NickName.create(nickName),
      email: Email.create(email),
      phone: NullableUtils.of(phone, Phone.create),
      photo: NullableUtils.of(photo, ImageUrl.create),
      bio: NullableUtils.of(bio, Bio.create),
      isActive: true,
      isAdmin: false,
      isVerified: false,
      createdAt: createdAt,
    );
  }

  void addBio(String value) {
    final newBio = Bio.create(value);
    appendErrorIfNecessary(newBio);
  }

  @override
  void validate(ValidationHandler handler) {
    UserValidator(user: this, handler: handler).validate();
  }
}
