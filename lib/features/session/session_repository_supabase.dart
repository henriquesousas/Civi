// import 'package:deehelp/features/session/session_model.dart';
// import 'package:deehelp/features/session/session_repository.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class SessionRepositorySupabase implements SessionRepository {
//   final SupabaseClient _client;

//   SessionRepositorySupabase({required SupabaseClient client})
//       : _client = client;

//   @override
//   Future<void> create(SessionModel session) {
//     // final session = _client.auth.currentSession;
//     final currentUser = _client.auth.currentUser;

//     if (currentUser != null) {
//       final String userId = currentUser.id;
//       final String? userEmail = currentUser.email;
//       final Map<String, dynamic>? metadata = currentUser.userMetadata;

//       final String? userName =
//           metadata?['full_name']?.toString() ?? metadata?['name']?.toString();
//       final String? photoUrl = metadata?['picture']?.toString();
//     }
//   }

//   @override
//   Future<void> delette() {
//     // TODO: implement delette
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> getSession() {
//     // TODO: implement getSession
//     throw UnimplementedError();
//   }
// }
