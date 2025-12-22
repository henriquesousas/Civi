import 'package:deehelp/core/unit.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/auth/domain/repositories/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProfileRepository extends ProfileRepository {
  final _profileTable = "profile";
  final SupabaseClient _client;

  SupabaseProfileRepository({required SupabaseClient client})
      : _client = client;

  @override
  Future<Result<Unit>> addNickname(String nickname, String userId) async {
    await _client.from(_profileTable).insert({
      "nickname": nickname,
      "user_id": userId,
    });

    return Result.success(const Unit());
  }
}
