import 'package:deehelp/business/user/usecases/get_profile/user_profile.dart';

abstract interface class UserDataSource {
  Future<UserProfile> getProfile(String userId);
}
