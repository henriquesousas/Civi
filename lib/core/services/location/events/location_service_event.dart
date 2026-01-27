import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/services/location/current_location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_service_event.freezed.dart';

@freezed
class LocationServiceEvent with _$LocationServiceEvent {
  const factory LocationServiceEvent.error(
    LocationStatus status,
    String message,
  ) = _LocationServiceEventError;

  const factory LocationServiceEvent.locationRequired(
    LocationStatus status,
    String message,
  ) = _LocationServiceEventLocationRequired;
  const factory LocationServiceEvent.success(CurrentLocation? currentPlace) =
      _LocationServiceEventSuccess;
}
