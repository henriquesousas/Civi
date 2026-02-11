import 'package:deehelp/old_features/incident/presentation/report/events/report_incident_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportIncidentEventProvider =
    StateProvider.autoDispose<ReportIncidentEvent?>((_) => null);
