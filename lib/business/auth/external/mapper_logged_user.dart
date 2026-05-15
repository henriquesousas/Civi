import 'package:deehelp/business/auth/domain/logged_user.dart';
import 'package:supabase/supabase.dart';

class MapperLoggedUser {
  static LoggedUser create(User user) {
    final String dysplayName =
        user.userMetadata?['full_name']?.toString() ?? '';
    final String? photoUrl = user.userMetadata?['picture']?.toString();

    return LoggedUser(
      id: user.id,
      name: dysplayName,
      email: user.email ?? '',
      photoUrl: photoUrl,
      authMethod: AuthMethod.google,
    );
  }
}
