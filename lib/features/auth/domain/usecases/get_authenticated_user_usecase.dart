import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/domain/repositories/session_repository.dart';

import '../exceptions/get_current_user_failure.dart';

class GetAuthenticatedUserUsecase
    implements UseCaseWithoutParam<AuthenticatedUser> {
  final SessionRepository _sessionRepository;
  GetAuthenticatedUserUsecase({
    required SessionRepository sessionRepository,
  }) : _sessionRepository = sessionRepository;

  @override
  Future<Result<AuthenticatedUser>> execute() async {
    final session = await _sessionRepository.getSession();
    if (session == null) {
      return Result.failure(const GetCurrentUserFailure());
    }
    return Result.success(session);
  }
}
