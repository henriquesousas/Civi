// import 'package:deehelp/core/services/cache/session/user_session.dart';
// import 'package:deehelp/core/services/cache/session/user_session_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class UserSessionServiceSharedPrefs implements UserSessionService {
//   final _keySessionUserId = "keySessionUserId";
//   final _keySessionUserName = "keySessionUserName";
//   final _keySessionUserPhoto = "keySessionUserPhoto";
//   final _keySessionUserEmail = "keySessionUserEmail";

//   @override
//   Future<UserSession?> load() async {
//     final sp = await SharedPreferences.getInstance();

//     final values = {
//       'id': sp.getString(_keySessionUserId),
//       'name': sp.getString(_keySessionUserName),
//       'email': sp.getString(_keySessionUserEmail),
//     };

//     if (values.values.any((v) => v == null)) {
//       return null;
//     }

//     return UserSession.from(
//       id: values['id']!,
//       name: values['name']!,
//       email: values['email']!,
//       photoUrl: sp.getString(_keySessionUserPhoto) ?? '',
//     );
//   }

//   @override
//   void save(UserSession session) async {
//     final sp = await SharedPreferences.getInstance();
//     await sp.setString(_keySessionUserId, session.id);
//     await sp.setString(_keySessionUserName, session.name);
//     await sp.setString(_keySessionUserEmail, session.email);
//     await sp.setString(_keySessionUserPhoto, session.photoUrl);
//   }
// }
