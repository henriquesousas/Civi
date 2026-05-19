import 'package:deehelp/business/_shared/entity/exports.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/business/user/user_repository.dart';
import 'package:deehelp/core/failures/exports.dart';
import 'package:fpdart/fpdart.dart';

class GetProfileUsecase extends UseCase<UniqueId, String> {
  final UserRepository _userRepository;

  GetProfileUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  TaskEither<Failure, String> execute(UniqueId data) {
    //Validar se o UniqueId é realmente valido

    _userRepository.getProfile(data.value);
    return TaskEither.right("any");
  }
}

/**
 * {
	"status": true,
	"code": 200,
	"message": "sucesso",
	"data": {
		"id": "17fb07ad-2ecd-4f8c-90b9-0d8ce86925e3",
		"name": "Paulo Soares",
		"nickname": "1778880240721",
		"email": "paulohenriquess2014@gmail.com",
		"phone": null,
		"url_photo": "https://lh3.googleusercontent.com/a/ACg8ocIbt5wtXDUL8OgepP176YXzNwNxLj1-GR_y-sel1cAyL6c2zfgCQA=s96-c",
		"bio": null,
		"is_admin": false,
		"is_verified": true,
		"status": "active",
		"total_alerts": 0,
		"total_views": 0,
		"total_comments": 0,
		"archivements": [
			{
				"code": "FIRST_ALERT",
				"name": "LevelUp"
			},
			{
				"code": "PROFILE_COMPLETED",
				"name": "Perfil completo"
			}
		],
		"account_deletion_request": null
	}
}
 */
