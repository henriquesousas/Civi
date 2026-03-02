import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/module/auth/domain/entity/authenticated_user.dart';

abstract class AuthRepository {
  Future<Result<AuthenticatedUser>> signInWithCredentials(
    String idToken,
    String accessToken,
  );
  Future<Result<Unit>> signOut();
  Future<Result<AuthenticatedUser>> getCurrentUser();
}
