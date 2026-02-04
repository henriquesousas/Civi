import 'package:app_feature/src/location/base_location_issue_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsDisabledPage extends StatelessWidget {
  const GpsDisabledPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLocationIssuePage(
      title: "Ative o GPS",
      message:
          "Para funcionar corretamente, o Kotto precisa acessar sua localização.",
      buttonName: "Ativar GPS",
      action: () async {
        await Geolocator.openLocationSettings();
      },
    );
  }
}
