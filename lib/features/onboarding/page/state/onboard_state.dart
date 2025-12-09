import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboard_state.freezed.dart';

@freezed
class OnboardState with _$OnboardState {
  const factory OnboardState.initial() = _OnboardStateInitial;
  const factory OnboardState.loginSuccess() = _OnboardStateLoginSuccess;
  const factory OnboardState.loginError() = _OnboardStateLoginError;
}
