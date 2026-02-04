import 'package:app_feature/src/location/base_location_issue_page.dart';
import 'package:flutter/material.dart';

class LocationRequiredPage extends StatelessWidget {
  const LocationRequiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLocationIssuePage(
      title: "Permita o acesso à localização",
      message: "O Kotto precisa da sua permissão para acessar a localização.",
      buttonName: "Permitir localização",
      action: () {
        debugPrint("Action");
      },
    );
  }
}
