import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    String? nickname,
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isFormValid,
    @Default([]) List<String> suggestedNicknames,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState();
}
