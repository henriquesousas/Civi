import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/domain/utils/nickname_utils.dart';
import 'package:deehelp/features/profile/domain/usecase/add-nickname/add_nick_name_usecase.dart';
import 'package:deehelp/features/profile/presentation/views/add_nickname/state/nickname_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/unit.dart';
import '../../../../../core/handlers/handle_command.dart';
import '../../../domain/usecase/add-nickname/add_nick_name_dto.dart';

class NicknameViewModel extends StateNotifier<NicknameState> {
  final AddNickNameUsecase _addNickNameUsecase;

  NicknameViewModel({required AddNickNameUsecase addNickNameUsecase})
      : _addNickNameUsecase = addNickNameUsecase,
        super(NicknameState.initial());

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
    HandleCommand.execute<Unit, NicknameState>(
      updateState: (newState) => state = newState,
      command: () => _addNickNameUsecase.execute(dto),
      onLoading: () => state.copyWith(isLoading: true),
      onSuccess: (_) => state.copyWith(isSuccess: true, isLoading: false),
      onError: (error) {
        return handleError<NicknameState>(
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
