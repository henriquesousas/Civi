import 'package:freezed_annotation/freezed_annotation.dart';

part 'nickname_state.freezed.dart';

@freezed
abstract class NicknameState with _$NicknameState {
  const factory NicknameState({
    String? nickname,
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isFormValid,
    @Default([]) List<String> suggestedNicknames,
  }) = _NicknameState;

  factory NicknameState.initial() => const NicknameState();
}
