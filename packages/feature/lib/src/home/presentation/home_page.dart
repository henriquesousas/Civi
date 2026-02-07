import 'package:app_core/app_core.dart';
import 'package:app_feature/src/home/presentation/widgets/home_app_bar.dart';
import 'package:app_feature/src/home/presentation/widgets/home_register_incident_button.dart';
import 'package:app_feature/src/home/presentation/widgets/recent_incident_list.dart';
import 'package:app_feature/src/home/presentation/widgets/section_quick_actions.dart';
import 'package:app_feature/src/home/presentation/widgets/home_search_field.dart';
import 'package:app_feature/src/home/presentation/widgets/location_banner.dart';
import 'package:app_feature/src/profile/profile_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocationState = ref.watch(currentLocationProvider);
    //  final session = ref.watch(authenticatedUserProvider);

    return Scaffold(
      appBar: HomeAppBar(
        userName: "Paulo Silva",
        profileImageUrl:
            "https://www.adobe.com/br/express/feature/image/remove-background/png/media_142f9cf5285c2cdcda8375c1041d273a3f0383e5f.png?width=30000&format=png&optimize=medium&quality=80",
        press: () => context.push(ProfileRouter.path),
      ),
      bottomNavigationBar: HomeRegisterIncidentButton(
        onTap: () {},
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(LayoutSpacingSize.page),
          children: [
            LocationBanner(
              title: "Localização atual",
              primaryText: currentLocationState?.city ?? '',
              secondaryText: currentLocationState?.address ?? '',
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
