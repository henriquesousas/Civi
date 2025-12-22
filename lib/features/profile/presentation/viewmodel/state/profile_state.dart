import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileStateInitial;
  // const factory ProfileState.error(String error) = ProfileStateError;
  // const factory ProfileState.loading() = ProfileStateLoading;
  // const factory ProfileState.success(String nickname) = ProfileStateSuccess;

  const factory ProfileState.data({
    String? nickname,
    String? validationError,
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isFormValid,
  }) = _Data;
}
