import 'package:deehelp/features/profile/external/di/profile_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/nickname_repository.dart';
import '../../domain/usecase/add-nickname/add_nick_name_usecase.dart';

final addNickNameUsecaseProvider = Provider(
  (ref) {
    final profileRepository =
        ref.watch<NicknameRepository>(nicknameRepositoryProvider);
    return AddNickNameUsecase(repository: profileRepository);
  },
);
