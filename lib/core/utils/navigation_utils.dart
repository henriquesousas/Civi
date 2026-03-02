import 'package:deehelp/feature/auth/presentation/auth_router.dart';
import 'package:deehelp/module/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationUtils {
  static String path(
    String destiny,
    AuthenticatedUser? user,
  ) {
    return user == null ? AuthRouter.path : destiny;
  }

  static String safeNavigation(
    String destiny,
    WidgetRef ref,
  ) {
    final user = ref.read(authenticatedUserProvider);
    return user == null ? AuthRouter.path : destiny;
  }
}
