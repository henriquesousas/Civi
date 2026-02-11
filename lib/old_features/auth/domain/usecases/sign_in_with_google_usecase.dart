import 'package:deehelp/old_core/base/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_core/ui/extensions/result_extension.dart';
import 'package:deehelp/old_features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/old_features/auth/domain/exceptions/auth_failure.dart';
import 'package:deehelp/old_features/auth/domain/repositories/auth_repository.dart';
import 'package:deehelp/old_features/auth/domain/services/google_auth_service.dart';

class SignInWithGoogleUseCase extends UseCaseWithoutParam<AuthenticatedUser> {
  final GoogleAuthService _googleAuthService;
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase({
    required GoogleAuthService googleAuthService,
    required AuthRepository authRepository,
  })  : _googleAuthService = googleAuthService,
        _authRepository = authRepository;

  @override
  Future<Result<AuthenticatedUser>> execute() async {
    final googleAuth = await _googleAuthService.auth();

    if (googleAuth.isFailure) {
      return Result.failure(const AuthFailure(
        "Não foi possível se autenticar com o Google.",
      ));
    }

    final credentials = googleAuth.data!;
    return await _authRepository.signInWithCredentials(
      credentials.idToken,
      credentials.accessToken,
    );
  }
}
