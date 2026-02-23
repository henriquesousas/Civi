import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/old_core/ui/widgets/shimmer_animation.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_product_output.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_list_item.dart';
import 'package:flutter/material.dart';

final _fakeIncident = IncidentOutput(
  id: 'any',
  userId: 'any',
  alertId: 'any',
  product: IncidentProductOutput(
    productId: "123",
    name: "any name",
    code: "any",
    images: List.empty(),
    color: '',
    brand: '',
    type: "car",
  ),
  status: ItemStatus.active,
  type: TypeAlert.detailed,
  howTo: 'loremipsin loremipsm loremipsum loremipsum',
  local: IncidentLocal(address: "any", city: "any", state: "any"),
  createdAt: DateTime.now(),
  occurredAt: DateTime.now(),
  occurredAtTime: TimeOfDay.now(),
);

class IncidentListShimmer extends StatelessWidget {
  const IncidentListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerAnimation(
      enabled: true,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: IncidentListItem(
            incident: _fakeIncident,
            isLoading: true,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
