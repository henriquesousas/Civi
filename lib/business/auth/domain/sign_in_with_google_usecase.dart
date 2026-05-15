import 'package:deehelp/business/_shared/failures/exports.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/business/auth/domain/logged_user.dart';
import 'package:deehelp/business/auth/domain/auth_repository.dart';
import 'package:deehelp/business/auth/external/google/google_auth_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logging/logging.dart';

class SignInWithGoogleUseCase extends UseCaseWithoutParam<LoggedUser> {
  static final _logger = Logger("SupabaseAuthRepository");
  final GoogleAuthService _googleAuthService;
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase({
    required GoogleAuthService googleAuthService,
    required AuthRepository authRepository,
  })  : _googleAuthService = googleAuthService,
        _authRepository = authRepository;

  @override
  TaskEither<Failure, LoggedUser> execute() {
    _logger
        .info("Executando GoogleAuthService para se authenticar com o Google");
    return _googleAuthService.auth().flatMap(
      (credentials) {
        _logger.info(
            "Chamando _authRepository.signInWithGoogle com credentials: ${credentials.toString()}");
        return _authRepository.signInWithGoogle(
          credentials.idToken,
          credentials.accessToken,
        );
      },
    );
  }
}
