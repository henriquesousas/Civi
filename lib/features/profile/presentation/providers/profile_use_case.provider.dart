import 'package:deehelp/features/profile/domain/repository/profile_repository.dart';
import 'package:deehelp/features/profile/domain/usecases/add_nickname/add_nick_name_usecase.dart';
import 'package:deehelp/features/profile/presentation/providers/profile_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addNickNameUsecaseProvider = Provider(
  (ref) {
    final profileRepository =
        ref.watch<ProfileRepository>(profileRepositoryProvider);
    return AddNickNameUsecase(repository: profileRepository);
  },
);
