import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final incidentSelectedProvider =
    StateProvider.autoDispose<IncidentOutput?>((ref) {
  return null;
});
