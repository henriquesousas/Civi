import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/domain/repositories/session_repository.dart';

import '../exceptions/unauthenticated_failure.dart';

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
      return Result.failure(const UnauthenticatedFailure());
    }
    return Result.success(session);
  }
}
