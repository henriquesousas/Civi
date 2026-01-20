import 'dart:async';

import 'package:deehelp/core/ui/extensions/result_extension.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_incident_usecase.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_usecase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final items = List.empty() as List<IncidentOutput>;

class DashboardViewmodel extends AsyncNotifier<List<IncidentOutput>> {
  late final GetIncidentUsecase _getIncidentUsecase;

  DashboardViewmodel();

  @override
  FutureOr<List<IncidentOutput>> build() async {
    _getIncidentUsecase = ref.watch(getIncidentUsecaseProvider);
    final result = await _getIncidentUsecase.execute("");
    return result.isSuccess
        ? result.data!
        : List.empty() as List<IncidentOutput>;
  }
}
