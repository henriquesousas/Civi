import 'dart:async';

import 'package:deehelp/core/providers/location_service_provider.dart';
import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final items = List.empty() as List<IncidentOutput>;

class DashboardViewmodel extends AsyncNotifier<List<IncidentOutput>> {
  final LocationService _locationService;
  DashboardViewmodel({required LocationService locationService})
      : _locationService = locationService;
  @override
  FutureOr<List<IncidentOutput>> build() async {
    await getCurrentPlace();
    return List.empty() as List<IncidentOutput>;
  }

  Future<void> getCurrentPlace() async {
    final currentPlace = await _locationService.getCurrentPlace();
    if (currentPlace != null) {
      ref.watch(locationServicProvider.notifier).state = currentPlace;
    }
  }
}
