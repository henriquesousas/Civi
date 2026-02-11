import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/old_features/auth/domain/entity/authenticated_user.dart';

abstract class AuthRepository {
  Future<Result<AuthenticatedUser>> signInWithCredentials(
    String idToken,
    String accessToken,
  );
  Future<Result<Unit>> signOut();
  Future<Result<AuthenticatedUser>> getCurrentUser();
}
