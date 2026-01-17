import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_incident_state.freezed.dart';

@freezed
class ListingIncidentState with _$ListingIncidentState {
  const factory ListingIncidentState.initial() = _ListIncidentStateInitial;
  const factory ListingIncidentState.loading() = _ListIncidentStateLoading;
  const factory ListingIncidentState.success(
    List<IncidentOutput> items,
    String selectedFilter,
  ) = _ListIncidentStateSuccess;
  const factory ListingIncidentState.error(String message) =
      _ListIncidentStateError;
  const factory ListingIncidentState.empty() = _ListIncidentStateEmpty;
}
