import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/search/widgets/load_skeleton.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/feature/incidents/list/widgets/inciden_list.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_empty_data.dart';
import 'package:deehelp/feature/incidents/providers/incident_list_viewmodel_provider.dart';
import 'package:deehelp/feature/incidents/providers/incident_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IncidentListPage extends ConsumerStatefulWidget {
  const IncidentListPage({super.key});

  @override
  ConsumerState<IncidentListPage> createState() => _ListingIncidentPageState();
}

class _ListingIncidentPageState extends ConsumerState<IncidentListPage> {
  void listener() {
    ref.listen<IncidentOutput?>(
      incidentSelectedProvider,
      (oldItem, currentItem) {
        if (oldItem != null && oldItem != currentItem) {
          ref
              .watch(incidentListViewModelProvider.notifier)
              .updateAt(currentItem!);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(incidentListViewModelProvider);
    listener();

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Minhas ocorrências",
        showBackButton: true,
        press: () => context.pop(),
      ),
      bottomNavigationBar: _bottomBar(),
      body: state.when(
        data: (incidents) => IncidenList(items: incidents),
        // loading: () => const ItemListShimmer(),
        loading: () => const LoadingResultsSkeleton(size: 10),
        error: (error, stackTrace) => const IncidentEmptyData(),
      ),
    );
  }

  Widget? _bottomBar() {
    return ref.watch(
      incidentListViewModelProvider.select(
        (state) {
          return state.hasValue && state.value!.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x142B5BEE),
                        blurRadius: 16,
                        offset: Offset(0, -6),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    top: false,
                    child: ButtonOutline(
                      press: () {
                        context.push(IncidentRouter.register);
                      },
                      bgColor: context.primaryColor,
                      textColor: Colors.white,
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                      text: "Registrar roubo",
                    ),
                  ),
                )
              : null;
        },
      ),
    );
  }
}
