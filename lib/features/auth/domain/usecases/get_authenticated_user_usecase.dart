import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';

class GetAuthenticatedUserUsecase
    implements UseCaseWithoutParam<AuthenticatedUser> {
  @override
  Future<Result<AuthenticatedUser>> execute() async {
    return Result.success(
      AuthenticatedUser(
        name: "Mock User",
        email: "mock@example.com",
        id: "12345",
        photoUrl: 'any',
      ),
    );
  }
}
