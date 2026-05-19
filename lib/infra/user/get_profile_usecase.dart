import 'package:deehelp/business/user/usecases/get_profile/get_profile_usecase.dart';
import 'package:deehelp/infra/user/repositories/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_profile_usecase.g.dart';

@riverpod
GetProfileUsecase getProfileUseCase(Ref ref) {
  return GetProfileUsecase(
    userRepository: ref.watch(userRepositoryProvider),
  );
}
