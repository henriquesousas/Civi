import 'package:app_feature/src/about/presentation/widgets/divider_idented.dart';
import 'package:app_feature/src/about/presentation/widgets/info_card.dart';
import 'package:app_feature/src/about/presentation/widgets/step_title.dart';
import 'package:flutter/material.dart';

class HowItWorksCard extends StatelessWidget {
  const HowItWorksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoCard(
      title: 'Como funciona',
      icon: Icons.auto_awesome_outlined,
      child: Column(
        children: [
          StepTile(
            index: 1,
            title: 'Cadastre seus itens',
            subtitle: 'Carro, moto ou celular — rápido e organizado.',
            icon: Icons.inventory_2_outlined,
          ),
          DividerIndented(),
          StepTile(
            index: 2,
            title: 'Reporte ocorrências',
            subtitle: 'Imediato (na hora) ou detalhado (com mais informações).',
            icon: Icons.report_outlined,
          ),
          DividerIndented(),
          StepTile(
            index: 3,
            title: 'Acompanhe o mapa',
            subtitle: 'Veja ocorrências na sua área e compartilhe alertas.',
            icon: Icons.map_outlined,
          ),
        ],
      ),
    );
  }
}
