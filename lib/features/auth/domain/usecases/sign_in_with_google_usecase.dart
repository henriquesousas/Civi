import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/result_extension.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/domain/repositories/auth_repository.dart';
import 'package:deehelp/features/auth/domain/services/google_auth_service.dart';

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
    return await _googleAuthService.auth().flatMap(
          (credential) => _authRepository.signInWithCredentials(
            credential.idToken,
            credential.accessToken,
          ),
        );
  }
}
