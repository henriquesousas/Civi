import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/widgets/empty/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncidentEmptyData extends StatelessWidget {
  const IncidentEmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      title: "Ótimo! Nenhum incidente para gerenciar no momento.",
      subtitle:
          "Para registrar um incidente, basta tocar no botão 'Registrar incidente' abaixo",
      btnTitle: "Registrar incidente",
      press: () => context.push(AppRouter.reportIncident),
    );
  }
}
