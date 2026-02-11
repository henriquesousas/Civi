import 'package:deehelp/old_core/ui/widgets/shimmer_animation.dart';
import 'package:deehelp/old_features/incident/domain/entity/incident_local.dart';
import 'package:deehelp/old_features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/old_features/incident/domain/enum/type_alert.dart';
import 'package:deehelp/old_features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/old_features/incident/domain/usecase/incident_product_output.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_list_item.dart';
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
  ),
  status: IncidentStatus.active,
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
        itemBuilder: (_, __) => IncidentListItem(
          incident: _fakeIncident,
          isLoading: true,
          onPressed: () {},
        ),
      ),
    );
  }
}
