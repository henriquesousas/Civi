import 'dart:async';

import 'package:deehelp/core/ui/extensions/result_extension.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_incident_filter.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_incident_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardViewmodel
    extends StateNotifier<AsyncValue<List<IncidentOutput>>> {
  final GetIncidentUsecase _getIncidentUsecase;

  DashboardViewmodel({required GetIncidentUsecase getIncidentUsecase})
      : _getIncidentUsecase = getIncidentUsecase,
        super(const AsyncValue.loading());

  Future<void> loadData(String userState) async {
    state = const AsyncValue.loading();
    try {
      final filter = GetIncidentFilter(
        status: IncidentStatus.active,
        state: userState,
        limit: 5,
      );

      final result = await _getIncidentUsecase.execute(filter);

      if (result.isSuccess) {
        state = AsyncValue.data(result.data!);
      } else {
        state = AsyncValue.data([] as List<IncidentOutput>);
      }
    } catch (e, _) {
      state = AsyncValue.data([] as List<IncidentOutput>);
    }
  }
}
