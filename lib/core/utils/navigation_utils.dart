import 'package:deehelp/feature/auth/presentation/auth_router.dart';
import 'package:deehelp/business/auth/domain/logged_user.dart';
import 'package:deehelp/business/auth/di/loggued_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationUtils {
  static String path(
    String destiny,
    LoggedUser? user,
  ) {
    return user == null ? AuthRouter.path : destiny;
  }

  static String safeNavigation(
    String destiny,
    WidgetRef ref,
  ) {
    final user = ref.read(logguedUserProvider);
    return user == null ? AuthRouter.path : destiny;
  }
}
