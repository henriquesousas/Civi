import 'package:deehelp/business/user/usecases/get_profile/profile.dart';
import 'package:deehelp/business/user/user_datasource.dart';
import 'package:deehelp/business/user/user_repository.dart';
import 'package:deehelp/core/failures/failure.dart';
import 'package:deehelp/infra/archivement/archivement_repository_remote.dart';
import 'package:deehelp/infra/user/repositories/models/profile_model.dart';
import 'package:fpdart/fpdart.dart';

class UserRepositoryRemote extends UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryRemote({required UserDataSource datasource})
    : _dataSource = datasource;

  @override
  TaskEither<Failure, Profile> getProfile(String userId) {
    return TaskEither.tryCatch(() async {
      final result = await _dataSource.getProfile(userId);
      final profileOutput = ProfileModel.fromJson(result['data']);
      return profileOutput.toProfile();
    }, (error, stackTrace) => error.toFailure());
  }
}
