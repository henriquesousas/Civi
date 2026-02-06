import 'package:app_core/app_core.dart';
import 'package:app_feature/src/home/presentation/widgets/home_register_incident_button.dart';
import 'package:app_feature/src/home/presentation/widgets/recent_incident_list.dart';
import 'package:app_feature/src/home/presentation/widgets/section_quick_actions.dart';
import 'package:app_feature/src/home/presentation/widgets/home_search_field.dart';
import 'package:app_feature/src/home/presentation/widgets/location_banner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        userName: "João Silva",
        profileImageUrl: "https://i.pravatar.cc/150?img=3",
      ),
      bottomNavigationBar: HomeRegisterIncidentButton(
        onTap: () {},
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(LayoutSpacingSize.page),
          children: [
            const LocationBanner(
              title: "Localização atual",
              primaryText: "Osasco, São Paulo",
              secondaryText: "Travessa Francisco Alves da Silva",
            ),
            const SizedBox(height: SpacingSize.xl),
            HomeSearchField(
              onTap: () {},
              hint: 'Buscar ocorrências, locais ou serviços',
            ),
            const SizedBox(height: SpacingSize.xxl),
            SectionQuickActions(
              actionText: "sasas",
              onAction: () {},
            ),
            const SizedBox(height: SpacingSize.xxl),
            RecentIncidenList(items: [
              RecentIncidentItem(
                title: "Roubo de celular",
                location: "Centro - Osasco",
                imageUrl: 'https://i.pravatar.cc/150?img=5',
              ),
              RecentIncidentItem(
                title: "Roubo de celular",
                location: "Centro - Osasco",
                imageUrl: 'https://i.pravatar.cc/150?img=5',
              ),
              RecentIncidentItem(
                title: "Roubo de celular",
                location: "Centro - Osasco",
                imageUrl: 'https://i.pravatar.cc/150?img=5',
              ),
              RecentIncidentItem(
                title: "Roubo de celular",
                location: "Centro - Osasco",
                imageUrl: 'https://i.pravatar.cc/150?img=5',
              ),
              RecentIncidentItem(
                title: "Roubo de celular",
                location: "Centro - Osasco",
                imageUrl: 'https://i.pravatar.cc/150?img=5',
              ),
            ])
          ],
        ),
      ),
    );
  }
}
