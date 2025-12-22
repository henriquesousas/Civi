import 'package:deehelp/features/profile/domain/usecases/add_nickname/add_nick_name_usecase.dart';
import 'package:deehelp/features/profile/presentation/providers/profile_use_case.provider.dart';
import 'package:deehelp/features/profile/presentation/viewmodel/profile_view_model.dart';
import 'package:deehelp/features/profile/presentation/viewmodel/state/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>(
  (ref) {
    final addNicknameUseCase =
        ref.watch<AddNickNameUsecase>(addNickNameUsecaseProvider);
    return ProfileViewModel(addNickNameUsecase: addNicknameUseCase);
  },
);
