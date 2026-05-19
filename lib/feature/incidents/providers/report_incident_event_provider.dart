import 'package:deehelp/feature/incidents/report/events/report_incident_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final reportIncidentEventProvider =
    StateProvider.autoDispose<ReportIncidentEvent?>((_) => null);
