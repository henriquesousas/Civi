import 'package:deehelp/business/auth/providers/auth_datasource_provider.dart';
import 'package:deehelp/business/auth/auth_repository.dart';
import 'package:deehelp/core/data/auth/auth_repository_remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.watch(authDataSourceProvider);
  return AuthRepositoryRemote(datasource: authDataSource);
});
