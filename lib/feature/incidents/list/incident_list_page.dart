import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/services/network/network_info.dart';
import 'package:deehelp/old_core/services/network/network_info_provider.dart';
import 'package:deehelp/old_core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/old_core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/search/widgets/load_skeleton.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/feature/incidents/list/widgets/inciden_list.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_empty_data.dart';
import 'package:deehelp/feature/incidents/providers/incident_list_viewmodel_provider.dart';
import 'package:deehelp/feature/incidents/providers/incident_selected_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IncidentListPage extends ConsumerStatefulWidget {
  const IncidentListPage({super.key});

  @override
  ConsumerState<IncidentListPage> createState() => _ListingIncidentPageState();
}

class _ListingIncidentPageState extends ConsumerState<IncidentListPage> {
  @override
  void initState() {
    super.initState();
  }

  void listener() {
    ref.listen<IncidentOutput?>(
      incidentSelectedProvider,
      (oldItem, currentItem) {
        if (oldItem != null && oldItem != currentItem) {
          final ni = ref.watch(networkInfoProvider);
          final niProvider = incidentListViewModelProvider(ni);
          incidentListViewModelProvider(ni);
          ref.watch(niProvider.notifier).updateAt(currentItem!);
          // ref
          //     .watch(incidentListViewModelProvider.notifier)
          //     .updateAt(currentItem!);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(incidentListViewModelProvider);
    final ni = ref.watch(networkInfoProvider);
    final niProvider = incidentListViewModelProvider(ni);
    incidentListViewModelProvider(ni);
    final state = ref.watch(niProvider);

    listener();

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: DefaultAppBar(
        title: "Minhas ocorrências",
        showBackButton: true,
        press: () => context.pop(),
      ),
      bottomNavigationBar: _bottomBar(ni),
      body: state.when(
        data: (incidents) => Container(
          decoration: BoxDecoration(
            color: context.primaryBgCard,
            border: Border.all(
              color: context.outlineVariantColor,
            ),
          ),
          child: IncidenList(items: incidents),
        ),
        // loading: () => const ItemListShimmer(),
        // loading: () => const LoadingResultsSkeleton(size: 10),
        loading: () => const LoadingResultsSkeletonV2(),
        error: (error, stackTrace) => const IncidentEmptyData(),
      ),
    );
  }

  Widget? _bottomBar(NetworkInfo info) {
    return ref.watch(
      incidentListViewModelProvider(info).select(
        (state) {
          return state.hasValue && state.value!.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  child: SafeArea(
                    top: false,
                    child: ButtonOutline(
                      borderColor: context.primaryContainer,
                      press: () {
                        context.push(IncidentRouter.register);
                      },
                      bgColor: context.primaryColor,
                      textColor: Colors.white,
                      // icon: const Icon(
                      //   CupertinoIcons.add,
                      //   color: Colors.black,
                      // ),
                      text: "Criar alerta",
                    ),
                  ),
                )
              : null;
        },
      ),
    );
  }
}
