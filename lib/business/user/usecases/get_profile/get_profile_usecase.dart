import 'package:deehelp/business/_shared/entity/exports.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/business/user/usecases/get_profile/profile.dart';
import 'package:deehelp/business/user/user_notfound_failure.dart';
import 'package:deehelp/business/user/user_repository.dart';
import 'package:deehelp/core/failures/exports.dart';
import 'package:fpdart/fpdart.dart';

class GetProfileUsecase extends UseCase<String, Profile> {
  final UserRepository _userRepository;

  GetProfileUsecase({required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  TaskEither<Failure, Profile> execute(String userId) {
    final uniqueId = UniqueId.create(userId);
    if (uniqueId.hasError) {
      return TaskEither.left(const UserNotfoundFailure());
    }
    return _userRepository.getProfile(uniqueId.value);
  }
}
