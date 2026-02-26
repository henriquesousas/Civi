import 'package:deehelp/feature/search/widgets/mode_toogle.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';

enum SortDirection {
  asc,
  desc,
}

class IncidentFilter {
  final IncidentStatus status;
  final SortDirection direction;
  final String orderBy;
  final int limit;
  final String term;
  final SearchMode mode;

  IncidentFilter({
    required this.status,
    required this.term,
    this.mode = SearchMode.auto,
    this.limit = 30,
    this.direction = SortDirection.desc,
    this.orderBy = "created_at",
  });
}
