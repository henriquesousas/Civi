import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/old_core/ui/widgets/empty/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncidentEmptyData extends StatelessWidget {
  const IncidentEmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      title: "Nenhuma ocorrência encontrada",
      subtitle:
          "Quando você registrar ou acompanhar uma ocorrência, ela aparecerá aqui.",
      buttonText: "Criar alerta",
      onRetry: () => context.push(IncidentRouter.register),
      highlightIcon: Icon(
        Icons.search,
        size: IconSizes.xl,
        color: context.primaryColor,
      ),
    );
  }
}
