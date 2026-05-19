import 'package:deehelp/business/user/usecases/get_profile/user_profile.dart';
import 'package:deehelp/business/user/user.dart';
import 'package:deehelp/core/failures/exports.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository {
  void save(User user);
  TaskEither<Failure, UserProfile> getProfile(String userId);
}
