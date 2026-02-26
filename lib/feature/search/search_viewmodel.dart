import 'package:deehelp/feature/search/widgets/mode_toogle.dart';
import 'package:deehelp/old_core/ui/extensions/result_extension.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/get_incidents_usecase.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewmodel extends StateNotifier<AsyncValue<List<IncidentOutput>>> {
  final GetIncidentsUseCase _getIncidentsUseCase;

  SearchViewmodel({
    required GetIncidentsUseCase getIncidentsUseCase,
  })  : _getIncidentsUseCase = getIncidentsUseCase,
        super(const AsyncData([]));

  Future<void> search(String query, SearchMode mode) async {
    if (query.isEmpty) {
      state = const AsyncData([]);
    }

    // await Future.delayed(const Duration(milliseconds: 500));

    try {
      final filter = IncidentFilter(
        status: IncidentStatus.active,
        term: query,
        limit: 20,
        mode: mode,
      );
      final result = await _getIncidentsUseCase.execute(filter);
      state = AsyncValue.data(result.data!);
    } catch (e, _) {
      state = AsyncValue.data([] as List<IncidentOutput>);
    }
  }
}
