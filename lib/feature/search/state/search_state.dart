import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<IncidentOutput> items,
    @Default(false) bool isLoading,
    String? alertId,
  }) = _SearchState;
}
