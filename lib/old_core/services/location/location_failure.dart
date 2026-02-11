import 'package:deehelp/old_core/errors/failure.dart';
import 'package:deehelp/old_core/services/location/location_service.dart';

class LocationFailure extends Failure {
  final LocationStatus status;
  const LocationFailure({
    required this.status,
    required String message,
  }) : super(message);
}
