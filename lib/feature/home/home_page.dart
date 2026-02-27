import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/services/permissions/location/providers/location_providers.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/core/utils/navigation_utils.dart';
import 'package:deehelp/feature/home/widgets/card_header.dart';
import 'package:deehelp/feature/home/widgets/empty_incident_state.dart';
import 'package:deehelp/feature/home/widgets/incident_loading.dart';
import 'package:deehelp/feature/home/widgets/incident_row_item.dart';
import 'package:deehelp/feature/home/widgets/pill.dart';
import 'package:deehelp/feature/home/widgets/quick_action_tile.dart';
import 'package:deehelp/feature/home/widgets/thini_divider.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/incidents/list/widgets/fake_incident_list_model.dart';
import 'package:deehelp/feature/incidents/providers/incident_selected_provider.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/profile/export_profile.dart';
import 'package:deehelp/feature/search/search_args.dart';
import 'package:deehelp/feature/search/search_router.dart';
import 'package:deehelp/feature/sos/sos_router.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_product_output.dart';
import 'package:deehelp/feature/home/home_viewmodel_provider.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final recentIncidents = [
  IncidentOutput(
    id: '123',
    userId: '123',
    alertId: "101020",
    type: TypeAlert.immediately,
    product: IncidentProductOutput(
      productId: "123",
      name: "any",
      code: "0000000",
      images: [
        ImageMedia.fromWeb(
            url: "sasasa", size: 1024, mimeType: "", imageName: "sassa")
      ],
      color: "Vermelho",
      brand: "Marca",
      type: ItemType.car.name,
    ),
    status: ItemStatus.active,
    createdAt: DateTime.now(),
    occurredAt: DateTime.now(),
    occurredAtTime: TimeOfDay.now(),
  ),
];

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String? _region;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final currenLocation = ref.watch(currentLocationProvider);
        _region = '${currenLocation?.city} • ${currenLocation?.state}';
        ref
            .read(homeViewmodelProvider.notifier)
            .getRecentIncidents(currenLocation);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewmodelProvider);

    return Scaffold(
      appBar: HomeAppBar(
        region: _region,
        press: () => context.push(ProfileRouter.path),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(LayoutSpacingSize.page),
          children: [
            PageCard(
              child: Column(
                children: [
                  const CardHeader(
                    title: 'Acesso rápido',
                    subtitle: 'Atalhos úteis para a sua região',
                    icon: Icons.flash_on_rounded,
                  ),
                  const ThinDivider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: QuickActionTile(
                                icon: Icons.record_voice_over_rounded,
                                title: 'Ocorrência',
                                subtitle: 'Registrar',
                                accent: AppColors.danger,
                                onTap: () {
                                  //  context.push(IncidentRouter.register)
                                  final path = NavigationUtils.safeNavigation(
                                      IncidentRouter.register, ref);
                                  context.push(path);
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: QuickActionTile(
                                icon: Icons.search_rounded,
                                title: 'Pesquisar',
                                subtitle: 'Placa / IMEI',
                                accent: context.primaryColor,
                                onTap: () => context.push(
                                  SearchRouter.search,
                                  extra: SearchArgs(showBackButton: true),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: QuickActionTile(
                                icon: Icons.inventory_2_outlined,
                                title: 'Item',
                                subtitle: 'Registrar novo',
                                accent: AppColors.success,
                                onTap: () {
                                  final path = NavigationUtils.safeNavigation(
                                    ItemsRouter.register,
                                    ref,
                                  );
                                  context.push(path);
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: QuickActionTile(
                                icon: Icons.shield_outlined,
                                title: 'Emergência',
                                subtitle: 'Contatos rápidos',
                                accent: const Color(0xFF6B7280),
                                onTap: () => context.push(SOSRouter.path),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            state.maybeMap(
              data: (data) {
                if (data.value.isEmpty) {
                  return const Expanded(child: EmptyIncidentsState());
                }
                return _incidents(data.value);
              },
              loading: (loading) {
                return const IncidentLoading();
              },
              orElse: () => const Expanded(child: EmptyIncidentsState()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _incidents(List<IncidentOutput> incidents) {
    return PageCard(
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: CardHeader(
                  title: 'Ocorrências recentes',
                  subtitle: 'Últimos registros próximos de você',
                  icon: Icons.public_rounded,
                  showBottomPadding: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 12),
                child: Pill(
                  text: '${incidents.length} itens',
                  icon: Icons.format_list_bulleted_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ThinDivider(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: incidents.length,
            separatorBuilder: (_, __) => const ThinDivider(indent: 14),
            itemBuilder: (_, i) => IncidentRowItem(
              incident: incidents[i],
              onTap: () {
                ref.watch(incidentSelectedProvider.notifier).state =
                    incidents[i];
                context.push(IncidentRouter.detail);
              },
            ),
          ),
          const ThinDivider(),
        ],
      ),
    );
  }
}
