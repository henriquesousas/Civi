import 'dart:async';

import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final items = List.empty() as List<IncidentOutput>;

class DashboardViewmodel extends AsyncNotifier<List<IncidentOutput>> {
  DashboardViewmodel();

  @override
  FutureOr<List<IncidentOutput>> build() async {
    return List.empty() as List<IncidentOutput>;
  }
}
