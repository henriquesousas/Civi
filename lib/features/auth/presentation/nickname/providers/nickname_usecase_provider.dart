import 'package:deehelp/features/auth/presentation/nickname/providers/nickname_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/nickname_repository.dart';
import '../../../domain/usecases/add_nick_name_usecase.dart';

final addNickNameUsecaseProvider = Provider(
  (ref) {
    final profileRepository =
        ref.watch<NicknameRepository>(nicknameeRepositoryProvider);
    return AddNickNameUsecase(repository: profileRepository);
  },
);
