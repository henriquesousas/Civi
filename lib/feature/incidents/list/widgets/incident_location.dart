import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:flutter/material.dart';

class IncidentLocation extends StatelessWidget {
  final IncidentLocal? local;
  const IncidentLocation({super.key, this.local});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Icon(
          Icons.location_on_outlined,
          size: IconSizes.xxs,
        ),
        Expanded(
          child: Text(
            _getLocation(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTextOld.caption,
          ),
        ),
      ],
    );
  }

  String _getLocation() {
    if (local?.city?.isEmpty == true && local?.state?.isEmpty == true) {
      return "Local não informado.";
    }

    return "Roubado (a) em ${local?.city} - ${local?.state}";
  }
}
