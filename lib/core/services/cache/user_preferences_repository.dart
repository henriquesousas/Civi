import 'package:deehelp/core/services/cache/user_preferences.dart';

abstract class UserPreferencesRepository {
  void savePreferences(UserPreferences prefs);
  Future<UserPreferences> loadPreferences();
}
