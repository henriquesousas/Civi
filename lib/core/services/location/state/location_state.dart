import 'package:deehelp/core/services/location/location_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  // const factory LocationState({
  //   @Default(false) bool isLoading,
  // }) = _LocationState;

  // factory LocationState.initial() => const LocationState();

  // const factory LocationState.initial() = _Initial;
  const factory LocationState.loading() = _Loading;
  const factory LocationState.granted() = _Granted;
  const factory LocationState.serviceDisabled() = _ServiceDisabled;
  const factory LocationState.checking() = _Checking;
  const factory LocationState.denied(LocationStatus status, String message) =
      _Denied;
  const factory LocationState.deniedPermanently(
      LocationStatus status, String message) = _DeniedPermanently;
}
