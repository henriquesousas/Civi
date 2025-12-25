import 'package:deehelp/features/auth/domain/usecases/add_nick_name_usecase.dart';
import 'package:deehelp/features/auth/presentation/nickname/nickname_view_model.dart';
import 'package:deehelp/features/auth/presentation/nickname/providers/nickname_usecase_provider.dart';
import 'package:deehelp/features/auth/presentation/nickname/state/nickname_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nicknameViewModelProvider =
    StateNotifierProvider<NicknameViewModel, NicknameState>(
  (ref) {
    final addNicknameUseCase =
        ref.watch<AddNickNameUsecase>(addNickNameUsecaseProvider);
    return NicknameViewModel(addNickNameUsecase: addNicknameUseCase);
  },
);
