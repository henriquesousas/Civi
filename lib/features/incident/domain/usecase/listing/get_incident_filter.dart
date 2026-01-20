import 'package:deehelp/features/incident/domain/enum/incident_status.dart';

enum SortDirection {
  asc,
  desc,
}

class GetIncidentFilter {
  final IncidentStatus status;
  final SortDirection direction;
  final String orderBy;
  final int? limit;
  final String state;

  GetIncidentFilter({
    required this.status,
    required this.state,
    this.limit = 30,
    this.direction = SortDirection.desc,
    this.orderBy = "created_at",
  });
}
