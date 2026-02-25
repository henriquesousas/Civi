import 'dart:async';

import 'package:deehelp/core/services/permissions/location/domain/current_location.dart';
import 'package:deehelp/old_core/ui/extensions/result_extension.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/get_recent_incidents_by_location_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewmodel extends StateNotifier<AsyncValue<List<IncidentOutput>>> {
  List<IncidentOutput> _cache = [];
  bool _hasCache = false;
  DateTime? _cacheTimestamp;
  static const Duration _cacheValidityDuration = Duration(minutes: 5);
  final GetRecentIncidentsByLocationUseCase _getIncidentUsecase;

  HomeViewmodel(
      {required GetRecentIncidentsByLocationUseCase getIncidentUsecase})
      : _getIncidentUsecase = getIncidentUsecase,
        super(const AsyncValue.loading());

  Future<void> getRecentIncidents(CurrentLocation? location) async {
    if (_hasCache && _isCacheValid()) {
      state = AsyncValue.data(_cache);
      return;
    }

    state = const AsyncValue.loading();
    try {
      final filter = IncidentFilter(
        status: IncidentStatus.active,
        term: location?.city ?? '',
        limit: 10,
      );

      final result = await _getIncidentUsecase.execute(filter);

      if (result.isSuccess) {
        _cache = result.data!;
        _hasCache = true;
        _cacheTimestamp = DateTime.now();
        state = AsyncValue.data(result.data!);
      } else {
        state = const AsyncValue.data([]);
      }
    } catch (e, _) {
      if (_hasCache) {
        state = AsyncValue.data(_cache);
      } else {
        state = const AsyncValue.data([]);
      }
    }
  }

  Future<void> refreshData(CurrentLocation? location) async {
    _hasCache = false;
    await getRecentIncidents(location);
  }

  void clearCache() {
    _cache = [];
    _hasCache = false;
    _cacheTimestamp = null;
  }

  bool _isCacheValid() {
    if (_cacheTimestamp == null) return false;

    final now = DateTime.now();
    return now.difference(_cacheTimestamp!) < _cacheValidityDuration;
  }
}
