import 'dart:async';

import 'package:deehelp/old_core/ui/extensions/result_extension.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/feature/incidents/providers/incident_usecase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncidentListViewModel
    extends AutoDisposeAsyncNotifier<List<IncidentOutput>> {
  List<IncidentOutput> _cacheIncidents = [];

  @override
  FutureOr<List<IncidentOutput>> build() => _fetchAll();

  Future<List<IncidentOutput>> _fetchAll() async {
    final authenticatedUser = ref.watch(authenticatedUserProvider);
    final getIncidentByUserUseCase =
        ref.watch(getIncidentByUserUseCaseProvider);
    final incidentOrError =
        await getIncidentByUserUseCase.execute(authenticatedUser!.id);

    if (incidentOrError.isFailure) {
      return [];
    }
    _cacheIncidents = incidentOrError.data as List<IncidentOutput>;
    return _cacheIncidents;
  }

  void updateAt(IncidentOutput current) {
    final index = _cacheIncidents.indexWhere((inc) => inc.id == current.id);
    if (index != -1) {
      _cacheIncidents = List<IncidentOutput>.from(_cacheIncidents);
      _cacheIncidents[index] = current;
      state = AsyncValue.data(_cacheIncidents);
    }
  }

  void removeAt(IncidentOutput current) {
    final index = _cacheIncidents.indexWhere((inc) => inc.id == current.id);
    if (index != -1) {
      _cacheIncidents.removeAt(index);
      state = AsyncValue.data(_cacheIncidents);
    }
  }
}
