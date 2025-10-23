import 'package:yousafe/core/domain/valueobjects/email.dart';
import 'package:yousafe/core/domain/valueobjects/image_url.dart';
import 'package:yousafe/core/domain/valueobjects/phone.dart';
import 'package:yousafe/features/auth/domain/name.dart';
import 'package:yousafe/features/auth/domain/status.dart';
import 'package:yousafe/features/auth/domain/sur_name.dart';

import 'gender.dart';

class User {
  final Name name;
  final SurName surName;
  final Gender gender;
  final Email email;
  final Phone phone;
  final String password;
  final Status status;
  final ImageUrl? photoUrl;
  final DateTime createdAt;
  final DateTime? deletedAt;

  User({
    required this.name,
    required this.surName,
    required this.gender,
    required this.email,
    required this.phone,
    required this.password,
    required this.status,
    required this.createdAt,
    this.photoUrl,
    this.deletedAt,
  });
}
