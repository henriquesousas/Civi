import 'package:dartz/dartz.dart';
import 'package:deehelp/core/domain/extension/either_extension.dart';
import 'package:deehelp/core/domain/type/result.dart';
import 'package:deehelp/core/domain/use_case.dart';
import 'package:deehelp/features/auth/data/firebase/google_sign_in_service.dart';
import 'package:deehelp/features/auth/domain/auth_exception.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';

import '../../user_builder.dart';

class LoginWithGoogleUsecase extends UseCaseWithParameter<User> {
  final GoogleSignInService googleSignInService;

  LoginWithGoogleUsecase({required this.googleSignInService});

  @override
  Future<EitherResult<User>> execute() async {
    final result = await googleSignInService.signIn();

    return result.fold((error) {
      return Left(AuthException.fromResult(error));
    }, (data) {
      final map = result.successOrNull as Map<String, dynamic>;
      final user = UserBuilder(
        name: map["name"],
        email: map["email"],
      ).withUserId(map["uid"]).withPhotoUrl(map["photoUrl"]).build();
      return Right(user);
    });
  }
}
