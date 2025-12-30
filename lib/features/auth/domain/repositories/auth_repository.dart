import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';

import '../../../../core/utils/result.dart';
import '../../../../core/ui/unit.dart';

abstract class AuthRepository {
  Future<Result<AuthenticatedUser>> signInWithCredentials(
    String idToken,
    String accessToken,
  );
  Future<Result<Unit>> signOut();
  Future<Result<AuthenticatedUser>> getCurrentUser();
}
