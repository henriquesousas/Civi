import 'package:deehelp/core/errors/handler_error.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/domain/utils/nickname_utils.dart';
import 'package:deehelp/features/profile/domain/usecases/add_nickname/add_nick_name_usecase.dart';
import 'package:deehelp/features/profile/presentation/viewmodel/state/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/unit.dart';
import '../../../../core/utils/command_state_notifier.dart';
import '../../domain/usecases/add_nickname/add_nick_name_dto.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final AddNickNameUsecase _addNickNameUsecase;

  ProfileViewModel({required AddNickNameUsecase addNickNameUsecase})
      : _addNickNameUsecase = addNickNameUsecase,
        super(ProfileState.initial());

  void suggestedNicknames() {
    final nicknameUtils = NicknameUtils().generateMany();
    state = state.copyWith(suggestedNicknames: nicknameUtils);
  }

  void onNicknameChange(String nickname) {
    bool hasSpace = nickname.contains(' ') || nickname.length < 3;
    final error = hasSpace ? "Apelido inválido..." : null;
    final isFormValid = error == null;

    state = state.copyWith(
      nickname: nickname,
      errorMessage: error,
      isFormValid: isFormValid,
    );
  }

  void addNickname(AuthenticatedUser authenticatedUser) async {
    final dto = AddNickNameDto(
      name: state.nickname!,
      userId: authenticatedUser.id,
    );
    CommandStateNotifier.execute<Unit, ProfileState>(
      updateState: (newState) => state = newState,
      command: () => _addNickNameUsecase.execute(dto),
      onLoading: () => state.copyWith(isLoading: true),
      onSuccess: (_) => state.copyWith(isSuccess: true, isLoading: false),
      onError: (error) {
        return handleError<ProfileState>(
          error,
          (_, __) {
            return state.copyWith(
              errorMessage: "Apelido já está em uso.",
              isLoading: false,
            );
          },
        );
      },
    );
  }
}
