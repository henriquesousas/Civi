import 'package:app_feature/src/gps/localization_issue_page.dart';
import 'package:flutter/material.dart';

class LocationAccessRequiredPage extends StatelessWidget {
  const LocationAccessRequiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LocalizationIssuePage(
      title: "Permita o acesso à localização",
      message: "O Kotto precisa da sua permissão para acessar a localização.",
      buttonName: "Permitir localização",
      action: () {
        debugPrint("Action");
      },
    );
  }
}
