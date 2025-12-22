import '../../../../core/unit.dart';
import '../../../../core/utils/result.dart';

abstract class ProfileRepository {
  Future<Result<Unit>> addNickname(String nickname, String userId);
}
