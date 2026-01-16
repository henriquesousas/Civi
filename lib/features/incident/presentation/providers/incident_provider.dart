import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final incideSelectableProvider =
    StateProvider.autoDispose<IncidentOutput?>((ref) {
  return null;
});
