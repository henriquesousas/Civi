import 'package:yousafe/features/auth/domain/entity/user.dart';

abstract class UserRepository {
  void save(User user);
}
