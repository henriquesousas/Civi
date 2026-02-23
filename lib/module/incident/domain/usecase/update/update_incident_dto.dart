import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';

class UpdateIncidentDto {
  final String incidentId;
  final String howTo;
  final String city;
  final String state;
  final String address;
  final bool visibility;
  final ItemStatus status;

  UpdateIncidentDto({
    required this.incidentId,
    required this.howTo,
    required this.city,
    required this.state,
    required this.address,
    required this.status,
    required this.visibility,
  });
}
