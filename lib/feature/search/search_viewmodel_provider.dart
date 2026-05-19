import 'package:deehelp/feature/search/state/search_state.dart';
import 'package:deehelp/feature/incidents/providers/incident_usecase_providers.dart';
import 'package:deehelp/feature/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final searchViewmodelProvider =
    StateNotifierProvider.autoDispose<SearchViewmodel, SearchState>((ref) {
  final getIncidentUsecase = ref.watch(getIncidentUsecaseProvider);
  ref.onDispose(() {
    debugPrint('Encerrou provider');
  });
  return SearchViewmodel(
    getIncidentsUseCase: getIncidentUsecase,
  );
});
