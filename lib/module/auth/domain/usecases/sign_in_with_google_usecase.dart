import 'package:deehelp/old_core/base/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_core/ui/extensions/result_extension.dart';
import 'package:deehelp/module/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/module/auth/domain/exceptions/auth_failure.dart';
import 'package:deehelp/module/auth/domain/repositories/auth_repository.dart';
import 'package:deehelp/module/auth/domain/services/google_auth_service.dart';
import 'package:logging/logging.dart';

class SignInWithGoogleUseCase extends UseCaseWithoutParam<AuthenticatedUser> {
  static final _logger = Logger("SupabaseAuthRepository");
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
    _logger.info("Google Auth result = $googleAuth");
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
