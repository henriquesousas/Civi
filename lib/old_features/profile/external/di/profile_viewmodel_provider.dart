import 'package:deehelp/old_features/profile/domain/usecase/add-nickname/add_nick_name_usecase.dart';
import 'package:deehelp/old_features/profile/presentation/views/add_nickname/nickname_view_model.dart';
import 'package:deehelp/old_features/profile/external/di/profile_usecase_provider.dart';
import 'package:deehelp/old_features/profile/presentation/views/add_nickname/state/nickname_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nicknameViewModelProvider =
    StateNotifierProvider<NicknameViewModel, NicknameState>(
  (ref) {
    final addNicknameUseCase =
        ref.watch<AddNickNameUsecase>(addNickNameUsecaseProvider);
    return NicknameViewModel(addNickNameUsecase: addNicknameUseCase);
  },
);
