import 'package:deehelp/features/dashboard/presentation/dashboard_viewmodel.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewmodelProvider =
    AsyncNotifierProvider<DashboardViewmodel, List<IncidentOutput>>(
  () => DashboardViewmodel(),
);
