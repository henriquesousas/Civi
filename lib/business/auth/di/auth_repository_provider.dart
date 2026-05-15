import 'package:deehelp/business/auth/di/auth_datasource_provider.dart';
import 'package:deehelp/business/auth/domain/auth_repository.dart';
import 'package:deehelp/business/auth/external/auth_repository_remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.watch(authDataSourceProvider);
  return AuthRepositoryRemote(datasource: authDataSource);
});
