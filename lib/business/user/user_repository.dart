import 'package:deehelp/business/user/usecases/get_profile/profile.dart';
import 'package:deehelp/business/user/entities/user.dart';
import 'package:deehelp/core/failures/exports.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository {
  void save(User user);
  TaskEither<Failure, Profile> getProfile(String userId);
}
