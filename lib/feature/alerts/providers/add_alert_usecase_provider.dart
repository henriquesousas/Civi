import 'package:deehelp/module/alert/add_alert_usecase.dart';
import 'package:deehelp/module/incident/external/di/incident_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addAlertUseCaseProvider = Provider<AddAlertUsecase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return AddAlertUsecase(repository: repository);
});
