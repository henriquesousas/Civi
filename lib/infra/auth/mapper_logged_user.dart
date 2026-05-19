import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:supabase/supabase.dart';

class MapperLoggedUser {
  static LogguedUser create(User user) {
    final String dysplayName =
        user.userMetadata?['full_name']?.toString() ?? '';
    final String? photoUrl = user.userMetadata?['picture']?.toString();

    return LogguedUser(
      id: user.id,
      name: dysplayName,
      email: user.email ?? '',
      photoUrl: photoUrl,
    );
  }
}
