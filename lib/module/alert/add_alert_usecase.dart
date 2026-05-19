import 'dart:math';

import 'package:deehelp/infra/failures/failure.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/business/_shared/utils/id_utils.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/module/alert/add_alert_dto.dart';
import 'package:deehelp/module/incident/domain/entity/incident.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/usecase/kind.dart';
import 'package:deehelp/module/incident/domain/usecase/report_type.dart';
import 'package:deehelp/module/incident/external/repository/region_dto.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/task_either.dart';

class AddAlertUsecase extends OLDUseCase<AddAlertDto, String> {
  final IncidentRepository _repository;

  AddAlertUsecase({
    required IncidentRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<String>> execute(AddAlertDto dto) async {
    String? regionId;
    if (dto.local.city != null) {
      regionId = await _repository.getRegion(
        RegionDto(
          city: dto.local.city!,
          state: dto.local.state!,
        ),
      );
    }

    final report = Incident(
      id: IdUtils.generate(),
      regionId: regionId,
      alertId: _generateIncidentId(),
      userId: dto.userId,
      status: IncidentStatus.active,
      occurredAt: DateTime.now(),
      occurredAtTime: TimeOfDay.now(),
      howTo: dto.alertTitle,
      local: dto.local,
      createdAt: DateTime.now(),
      kind: Kind.rouberry,
      reportType: ReportType.alertIncident,
      title: dto.alertTitle,
      type: dto.typeItem,
    );

    await _repository.save(report);
    return Result.success(report.alertId!);
  }

  //Deve virar um metodo helper
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
