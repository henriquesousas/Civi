import 'package:deehelp/infra/auth/datasouces/auth_datasource_provider.dart';
import 'package:deehelp/business/auth/auth_repository.dart';
import 'package:deehelp/infra/auth/repositories/auth_repository_remote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryRemote(
    datasource: ref.read(authDataSourceProvider),
  );
}
