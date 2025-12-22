// import 'package:deehelp/core/services/cache/user_preferences.dart';
// import 'package:deehelp/core/services/cache/user_preferences_repository.dart';
// import 'package:deehelp/core/services/session/user_session.dart';

// class UserPreferencesSharedPrefsRepository
//     implements UserPreferencesRepository {
//   final _keySawOnboarding = "keySawOnboarding";
//   final _keyWantsNotification = "keyWantsNotification";
//   final _keyIsDarkMode = "keyIsDarkMode";

//   @override
//   Future<UserPreferences> loadPreferences() {
//     // TODO: implement loadPreferences
//     throw UnimplementedError();
//   }

//   @override
//   void savePreferences(UserPreferences prefs) {
//     // TODO: implement savePreferences
//   }

//   @override
//   void saveSession(UserSession session) {
//     // TODO: implement saveSession
//   }

//   // @override
//   // void savePreferences(UserPreferences prefs) async {
//   //   final sp = await SharedPreferences.getInstance();
//   //   await sp.setBool(_keySawOnboarding, prefs.sawOnboarding);
//   //   await sp.setBool(_keyWantsNotification, prefs.wantsNotification);
//   //   await sp.setBool(_keyIsDarkMode, prefs.isDarkMode);
//   // }

//   // @override
//   // Future<UserPreferences> loadPreferences() async {
//   //   final sp = await SharedPreferences.getInstance();

//   //   return UserPreferences.from(
//   //     sawOnboarding: sp.getBool(_keySawOnboarding) ?? false,
//   //     wantsNotification: sp.getBool(_keyWantsNotification) ?? true,
//   //     isDarkMode: sp.getBool(_keyIsDarkMode) ?? false,
//   //   );
//   // }
// }
