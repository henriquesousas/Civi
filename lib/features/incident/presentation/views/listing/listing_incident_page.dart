import 'package:deehelp/core/base/base_page.dart';
import 'package:deehelp/core/extensions/dialog_extension.dart';
import 'package:deehelp/core/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_icon_button.dart';
import 'package:deehelp/core/ui/widgets/empty/empty_state_widget.dart';
import 'package:deehelp/core/ui/widgets/shimmer_animation.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_provider.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_viewmodel_providers.dart';
import 'package:deehelp/features/incident/presentation/views/listing/incident_shimmer.dart';
import 'package:deehelp/features/incident/presentation/views/listing/listing_incident_viewmodel.dart';
import 'package:deehelp/features/incident/presentation/views/listing/state/listing_incident_state.dart';
import 'package:deehelp/features/incident/presentation/views/listing/widgets/incident_list_item_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListingIncidentPage extends BasePage {
  const ListingIncidentPage({super.key});

  @override
  BasePageState<ListingIncidentPage> createState() =>
      _ListingIncidentPageState();
}

class _ListingIncidentPageState extends BasePageState<ListingIncidentPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(listingIncidentViewmodelProvider.notifier).getAllIncidents();
    });
  }

  @override
  String? pageTitle() => "Ocorrências";

  @override
  VoidCallback? onBackPress() {
    return () {
      context.pop();
    };
  }

  @override
  Widget? buildBottomNavigationBar() {
    return ref.watch(listingIncidentViewmodelProvider).maybeWhen(
          success: (items, selectedFilter) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: UIElevatedIconButton(
                icon: const Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                ),
                text: "Adicionar novo",
                press: () => {},
              ),
            ),
          ),
          orElse: () => null,
        );
  }

  @override
  void listener() {
    super.listener();
    ref.listen<IncidentOutput?>(
      incideSelectableProvider,
      (oldItem, currentItem) {
        if (oldItem != null && oldItem != currentItem) {
          debugPrint("Produto alterado com sucesso");
          ref
              .watch(listingIncidentViewmodelProvider.notifier)
              .refreshItem(currentItem!);
        }
      },
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    final state = ref.watch(listingIncidentViewmodelProvider);
    final viewModel = ref.watch(listingIncidentViewmodelProvider.notifier);
    return state.maybeMap(
      success: (value) => _buildView(value.items, viewModel),
      guard: (value) => _buildView(value.items, viewModel),
      loading: (value) => _buildView(listShimmer, viewModel, isLoading: true),
      orElse: () => EmptyStateWidget(
        title: "Ótimo! Nenhum incidente para gerenciar no momento.",
        subtitle:
            "Para registrar um incidente, basta tocar no botão 'Registrar incidente' abaixo",
        btnTitle: "Registrar incidente",
        press: () {},
      ),
    );
  }

  Widget _buildView(
    List<IncidentOutput> items,
    ListingIncidentViewmodel viewModel, {
    bool isLoading = false,
  }) {
    return ShimmerAnimation(
      enabled: isLoading,
      child: Column(
        spacing: 5,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final incident = items[index];
                      return IncidentListItemTileWidget(
                          incident: incident,
                          isLoading: isLoading,
                          onPressed: () {
                            ref.watch(incideSelectableProvider.notifier).state =
                                incident;
                            context.push(AppRouter.updateIncident);
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
