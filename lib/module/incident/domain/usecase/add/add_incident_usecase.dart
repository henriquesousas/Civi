import 'dart:math';

import 'package:deehelp/core/failures/failure.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/old_core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/business/_shared/utils/id_utils.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/module/incident/domain/entity/incident.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/product_already_exist_exception%20copy.dart';
import 'package:deehelp/module/incident/domain/product_not_found_exception.dart';
import 'package:deehelp/module/incident/domain/product_unavailable_exception.dart';
import 'package:deehelp/module/incident/domain/usecase/add/add_incident_dto.dart';
import 'package:deehelp/module/incident/external/repository/region_dto.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/task_either.dart';

class AddIncidentUsecase extends OLDUseCase<AddIncidentDto, String> {
  final IncidentRepository _repository;
  final ProductRepository _productRepository;

  AddIncidentUsecase({
    required IncidentRepository repository,
    required ProductRepository productRepository,
  })  : _repository = repository,
        _productRepository = productRepository;

  @override
  Future<Result<String>> execute(AddIncidentDto dto) async {
    //Verificar se tem o region
    String? regionId;
    if (dto.local?.city != null) {
      regionId = await _repository.getRegion(RegionDto(
        city: dto.local!.city!,
        state: dto.local!.state!,
      ));
    }

    //Verificar se o produto ja foi feito incidente com ele
    final incident =
        await _repository.getIncidentByProductId(dto.product.id.value);

    if (incident != null) {
      return Result.failure(const ProductAlreadyExistException());
    }

    //Valida se esta ativo
    final product = await _productRepository.getByCode(dto.product.code);

    if (product == null) {
      return Result.failure(const ProductNotFoundException());
    }

    if (product.status != ItemStatus.active) {
      return Result.failure(
        const ProductUnavailableException(),
      );
    }

    final report = Incident(
      id: IdUtils.generate(),
      regionId: regionId,
      alertId: _generateIncidentId(),
      product: dto.product,
      userId: dto.userId,
      status: dto.status,
      occurredAt: dto.occurredAt,
      occurredAtTime: dto.occurredAtTime,
      howTo: dto.howTo,
      local: dto.local,
      createdAt: DateTime.now(),
      kind: dto.kind,
      reportType: dto.reportType,
      type: product.type,
    );
    debugPrint("Salvando incidente com ID: ${report.id}");
    await _repository.save(report);
    return Result.success(report.alertId!);
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
