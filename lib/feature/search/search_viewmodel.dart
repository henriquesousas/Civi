import 'package:deehelp/feature/search/state/search_state.dart';
import 'package:deehelp/feature/search/widgets/mode_toogle.dart';
import 'package:deehelp/old_core/extension/result_extension.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/get_incidents_usecase.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class SearchViewmodel extends StateNotifier<SearchState> {
  List<IncidentOutput> _cache = [];
  final GetIncidentsUseCase _getIncidentsUseCase;

  SearchViewmodel({
    required GetIncidentsUseCase getIncidentsUseCase,
  })  : _getIncidentsUseCase = getIncidentsUseCase,
        super(const SearchState());

  // Future<void> search(String query, SearchMode mode) async {
  //   debugPrint("Filtrando por $query");
  //   debugPrint("Valor no cache ${_cache.length}");
  //   state = state.copyWith(isLoading: true, items: _cache);
  //   if (query.isEmpty) {
  //     state = state.copyWith(isLoading: false, items: _cache);
  //     return;
  //   }

  //   if (_cache.isNotEmpty) {
  //     final resultCache = _cache
  //         .where((item) => item.alertId.contains(query)
  //             // item.alertId.contains(query) ||
  //             // item.product?.code.contains(query),
  //             )
  //         .toList();
  //     debugPrint(
  //         'Resultado encontrado no cache ${resultCache.length.toString()}');
  //     if (resultCache.isNotEmpty) {
  //       state = state.copyWith(isLoading: false, items: resultCache);
  //       return;
  //     }
  //   }

  //   // await Future.delayed(const Duration(milliseconds: 500));
  //   debugPrint("Buscando da API");
  //   try {
  //     final filter = IncidentFilter(
  //       status: IncidentStatus.active,
  //       term: query,
  //       limit: 20,
  //       mode: mode,
  //     );
  //     final result = await _getIncidentsUseCase.execute(filter);
  //     _updateCache(result.data!);
  //     // _cache = result.data!;
  //     state = state.copyWith(isLoading: false, items: result.data!);
  //   } catch (e, _) {
  //     state = state.copyWith(isLoading: false, items: _cache);
  //   }
  // }

  Future<void> clear() async {
    debugPrint("Limpando");
    if (_cache.isNotEmpty) {
      state = state.copyWith(isLoading: false, items: _cache);
    }
  }

  // Future<void> getlast() async {
  //   debugPrint('getlast');
  //   // state = const AsyncValue.loading();

  //   try {
  //     final filter = IncidentFilter(
  //       status: IncidentStatus.active,
  //       term: '*',
  //       limit: 30,
  //     );
  //     final result = await _getIncidentsUseCase.execute(filter);
  //     state = state.copyWith(isLoading: false, items: result.data!);
  //   } catch (e, _) {
  //     state = state.copyWith(isLoading: false, items: _cache);
  //   }
  // }

  Future<void> _updateCache(List<IncidentOutput> newData) async {
    final map = {
      for (var item in _cache) item.id: item, // ou item.alertId
    };

    for (var item in newData) {
      map[item.id] = item; // sobrescreve se já existir
    }

    _cache = map.values.toList();
  }

  @override
  void dispose() {
    debugPrint('SearchViewmodel disposed');
    super.dispose();
  }
}
