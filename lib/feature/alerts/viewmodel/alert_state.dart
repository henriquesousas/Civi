import 'package:deehelp/core/services/permissions/location/domain/current_location.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_state.freezed.dart';

@freezed
abstract class AlertState with _$AlertState {
  const factory AlertState({
    CurrentLocation? location,
    String? errorMessage,
    @Default(false) registeredsuccessfully,
    @Default(TypeAlert.none) TypeAlert type,
    @Default(false) bool isLoading,
    String? alertId,
  }) = _AlertState;

  factory AlertState.initial() => const AlertState();
}
