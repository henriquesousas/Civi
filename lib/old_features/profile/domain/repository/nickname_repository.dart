import '../../../../old_core/utils/unit.dart';
import '../../../../old_core/utils/result.dart';

abstract class NicknameRepository {
  Future<Result<Unit>> addNickname(String nickname, String userId);
  Future<Result<String?>> getNickName(String userId);
}
