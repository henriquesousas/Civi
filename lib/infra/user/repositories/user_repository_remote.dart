import 'package:deehelp/business/user/usecases/get_profile/user_profile.dart';
import 'package:deehelp/business/user/user.dart';
import 'package:deehelp/business/user/user_datasource.dart';
import 'package:deehelp/business/user/user_repository.dart';
import 'package:deehelp/core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

class UserRepositoryRemote extends UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryRemote({required UserDataSource datasource})
      : _dataSource = datasource;

  @override
  TaskEither<Failure, UserProfile> getProfile(String userId) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  void save(User user) {
    // TODO: implement save
  }
}
