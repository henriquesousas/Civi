import 'package:deehelp/feature/auth/presentation/auth_router.dart';
import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:deehelp/business/auth/providers/loggued_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationUtils {
  static String path(
    String destiny,
    LogguedUser? user,
  ) {
    return user == null ? AuthRouter.path : destiny;
  }

  static String safeNavigation(
    String destiny,
    WidgetRef ref,
  ) {
    final user = ref.read(logguedUserProviderOld);
    return user == null ? AuthRouter.path : destiny;
  }
}
