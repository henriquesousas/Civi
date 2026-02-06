import 'package:app_core/src/services/permissions/location/domain/current_location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_access_state.freezed.dart';

@freezed
class LocationAccessState with _$LocationAccessState {
  const factory LocationAccessState.loading() = _StateLoading;
  const factory LocationAccessState.granted(CurrentLocation? location) =
      _StateGranted;
  const factory LocationAccessState.serviceDisabled() = _StateServiceDisabled;
  const factory LocationAccessState.checking() = _StateChecking;
  const factory LocationAccessState.denied() = _StateDenied;
  const factory LocationAccessState.deniedPermanently() =
      _StateDeniedPermanently;
}
