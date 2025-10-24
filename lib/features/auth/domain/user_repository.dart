import 'package:deehelp/features/auth/domain/entity/user.dart';

abstract class UserRepository {
  void save(User user);
}
