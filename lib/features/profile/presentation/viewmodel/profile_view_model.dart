import 'package:deehelp/core/unit.dart';
import 'package:deehelp/core/utils/command_state_notifier.dart';
import 'package:deehelp/features/profile/domain/usecases/add_nickname/add_nick_name_dto.dart';
import 'package:deehelp/features/profile/domain/usecases/add_nickname/add_nick_name_usecase.dart';
import 'package:deehelp/features/profile/presentation/viewmodel/state/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final AddNickNameUsecase _addNickNameUsecase;

  ProfileViewModel({required AddNickNameUsecase addNickNameUsecase})
      : _addNickNameUsecase = addNickNameUsecase,
        super(const ProfileState.data());

  void onNicknameChange(String nickname) {
    bool hasSpace = nickname.contains(' ') || nickname.length < 5;
    final error = hasSpace ? "Apelido inválido..." : null;
    final isFormValid = error == null;

    state = ProfileState.data(
      errorMessage: error,
      isFormValid: isFormValid,
      nickname: nickname,
    );
  }

  void addNickname() async {
    state.maybeMap(
      data: (data) {
        final dto = AddNickNameDto(name: data.nickname!, userId: "123");
        CommandStateNotifier.execute<Unit, ProfileState>(
          updateState: (newState) => state = newState,
          command: () => _addNickNameUsecase.execute(dto),
          onLoading: () => data.copyWith(isLoading: true),
          onSuccess: (_) => data.copyWith(isSuccess: false, isLoading: false),
          onError: (error) {
            return data.copyWith(errorMessage: "any error");
          },
        );
      },
      orElse: () => null,
    );
  }
}
