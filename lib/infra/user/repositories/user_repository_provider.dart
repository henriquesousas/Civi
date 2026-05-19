import 'package:deehelp/business/user/user_repository.dart';
import 'package:deehelp/infra/user/datasources/user_datasource_provider.dart';
import 'package:deehelp/infra/user/repositories/user_repository_remote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryRemote(
    datasource: ref.watch(userDataSourceProvider),
  );
}
