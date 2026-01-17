import 'dart:math';

import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/errors/failure.dart';
import 'package:deehelp/core/utils/id_utils.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/incident/domain/incident_repository.dart';
import 'package:deehelp/features/incident/domain/usecase/add/add_incident_dto.dart';

class AddIncidentUsecase extends UseCase<AddIncidentDto, String> {
  final IncidentRepository _repository;

  AddIncidentUsecase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<String>> execute(AddIncidentDto dto) async {
    return Result.failure(CacheFailure('any'));
    final incident = Incident(
      id: IdUtils.generate(),
      alertId: _generateIncidentId(),
      product: dto.product,
      userId: dto.userId,
      type: dto.type,
      status: dto.status,
      occurredAt: dto.occurredAt,
      occurredAtTime: dto.occurredAtTime,
      howTo: dto.howTo,
      local: dto.local,
      createdAt: DateTime.now(),
    );
    await _repository.save(incident);
    return Result.success(incident.alertId!);
  }

  String _generateIncidentId() {
    final random = Random();
    final now = DateTime.now();

    // Usa segundos do dia (0-86399) + random
    final secondsToday = now.hour * 3600 + now.minute * 60 + now.second;

    // Pega últimos 4 dígitos dos segundos
    final timePart = secondsToday % 10000;

    // Dígito aleatório (1-9) na frente
    final randomDigit = random.nextInt(9) + 1;

    // Combina: random(1) + time(4)
    final idNumber =
        (randomDigit * 10000 + timePart).toString().padLeft(5, '0');

    return 'INC$idNumber';
  }
}
