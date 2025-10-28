import 'package:deehelp/features/auth/data/auth_result.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';

abstract class AuthRepository {
  Future<AuthResult> save(User user);
  Future<AuthResult> login(String email, String password);
}
