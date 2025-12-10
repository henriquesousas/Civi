import 'package:deehelp/features/auth/domain/entity/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboard_state.freezed.dart';

@freezed
class OnboardState with _$OnboardState {
  const factory OnboardState.initial() = _Initial;
  const factory OnboardState.loading() = _Loading;
  const factory OnboardState.loginSucceeded(User user) = _LoginSuccess;
  const factory OnboardState.sessionReady() = _SessionReady;
  const factory OnboardState.loginFailed() = _LoginFailed;
}
