import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/router/app_router.dart';
import 'package:deehelp/old_core/ui/widgets/empty/empty_state_widget.dart';
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
      buttonText: "Registrar incidente",
      onRegisterItem: () => context.push(AppRouter.reportIncident),
      highlightIcon: Icon(
        Icons.search,
        size: IconSizes.xl,
        color: context.primaryColor,
      ),
    );
  }
}
