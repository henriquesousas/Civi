import 'package:deehelp/old_core/ui/extensions/result_extension.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/get_incidents_usecase.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/get_recent_incidents_by_location_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewmodel extends StateNotifier<AsyncValue<List<IncidentOutput>>> {
  final GetRecentIncidentsByLocationUseCase _getRecentsIncidents;
  final GetIncidentsUseCase _getIncidentsUseCase;

  SearchViewmodel({
    required GetRecentIncidentsByLocationUseCase getRecentsIncidents,
    required GetIncidentsUseCase getIncidentsUseCase,
  })  : _getRecentsIncidents = getRecentsIncidents,
        _getIncidentsUseCase = getIncidentsUseCase,
        super(const AsyncData([]));

  Future<void> search(String query) async {
    state = const AsyncLoading();

    if (query.isEmpty) {
      state = const AsyncData([]);
    }

    await Future.delayed(const Duration(milliseconds: 500));

    // final allItems = [
    //   IncidentOutput(
    //     id: '',
    //     userId: '',
    //     alertId: '',
    //     type: TypeAlert.immediately,
    //     product: IncidentProductOutput(
    //         productId: '', name: "name1", code: '', images: []),
    //     local: IncidentLocal(address: "sasa", city: "sasaa", state: 'asasa'),
    //     status: IncidentStatus.active,
    //     createdAt: DateTime.now(),
    //     occurredAt: DateTime.now(),
    //     occurredAtTime: TimeOfDay.now(),
    //   ),
    //   IncidentOutput(
    //     id: '',
    //     userId: '',
    //     alertId: '',
    //     type: TypeAlert.immediately,
    //     product: IncidentProductOutput(
    //         productId: '', name: "name1", code: '', images: []),
    //     local: IncidentLocal(address: "sasa", city: "sasaa", state: 'asasa'),
    //     status: IncidentStatus.active,
    //     createdAt: DateTime.now(),
    //     occurredAt: DateTime.now(),
    //     occurredAtTime: TimeOfDay.now(),
    //   ),
    //   IncidentOutput(
    //     id: '',
    //     userId: '',
    //     alertId: '',
    //     type: TypeAlert.immediately,
    //     product: IncidentProductOutput(
    //         productId: '', name: "name1", code: '', images: []),
    //     local: IncidentLocal(address: "sasa", city: "sasaa", state: 'asasa'),
    //     status: IncidentStatus.active,
    //     createdAt: DateTime.now(),
    //     occurredAt: DateTime.now(),
    //     occurredAtTime: TimeOfDay.now(),
    //   ),
    //   IncidentOutput(
    //     id: '',
    //     userId: '',
    //     alertId: '',
    //     type: TypeAlert.immediately,
    //     product: IncidentProductOutput(
    //         productId: '', name: "name1 DND0171", code: 'DND0171', images: []),
    //     local: IncidentLocal(address: "sasa", city: "sasaa", state: 'asasa'),
    //     status: IncidentStatus.active,
    //     createdAt: DateTime.now(),
    //     occurredAt: DateTime.now(),
    //     occurredAtTime: TimeOfDay.now(),
    //   ),
    // ];

    // final newList = allItems
    //     .where(
    //       (item) =>
    //           item.product.name.toLowerCase().contains(query.toLowerCase()) ||
    //           item.product.code.toLowerCase().contains(query.toLowerCase()),
    //     )
    //     .toList();

    try {
      final filter = IncidentFilter(
        status: IncidentStatus.active,
        term: query,
        limit: 20,
      );
      final result = await _getIncidentsUseCase.execute(filter);
      state = AsyncValue.data(result.data!);
    } catch (e, _) {
      state = AsyncValue.data([] as List<IncidentOutput>);
    }
  }
}
