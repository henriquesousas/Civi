import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/auth/domain/repositories/nickname_repository.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseNicknameRepository extends NicknameRepository {
  static final _logger = Logger("SupabaseProfileRepository");
  final _profileTable = "profile";
  final SupabaseClient _client;

  SupabaseNicknameRepository({required SupabaseClient client})
      : _client = client;

  @override
  Future<Result<Unit>> addNickname(String nickname, String userId) async {
    await _client.from(_profileTable).upsert({
      "nickname": nickname,
      "user_id": userId,
    });

    return Result.success(const Unit());
  }

  @override
  Future<Result<String?>> getNickName(String userId) async {
    String? nickName;

    try {
      final response = await _client
          .from(_profileTable)
          .select("nickname")
          .eq("user_id", userId)
          .maybeSingle();

      nickName = response?['nickname'] as String?;
    } catch (e) {
      _logger.info('Nickname not found: $e');
    }
    return Result.success(nickName);
  }
}
