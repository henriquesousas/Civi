import 'package:deehelp/feature/auth/presentation/auth_router.dart';
import 'package:deehelp/module/auth/domain/entity/authenticated_user.dart';

class NavigationUtils {
  static String path(String destiny, AuthenticatedUser? user) {
    return user == null ? AuthRouter.path : destiny;
  }
}
