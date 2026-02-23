import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _DashboardStateInitial;
  // const factory DashboardState.getCurrentLocation() =
  //     _DashboardStateGetCurrentLocation;
  const factory DashboardState.loading() = _DashboardStateLoading;
  const factory DashboardState.success(
    List<IncidentOutput> items,
  ) = _DashboardStateSuccess;
  // const factory ListingIncidentState.error(String message) =
  //     _ListIncidentStateError;
  // const factory ListingIncidentState.empty() = _ListIncidentStateEmpty;
}
