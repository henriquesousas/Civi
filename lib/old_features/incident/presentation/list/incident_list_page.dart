import 'package:deehelp/old_core/base/base_page.dart';
import 'package:deehelp/old_features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/inciden_list.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_button_report.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_empty_data.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_list_shimmer.dart';
import 'package:deehelp/old_features/incident/presentation/providers/incident_list_viewmodel_provider.dart';
import 'package:deehelp/old_features/incident/presentation/providers/incident_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IncidentListPage extends BasePage {
  const IncidentListPage({super.key});

  @override
  BasePageState<IncidentListPage> createState() => _ListingIncidentPageState();
}

class _ListingIncidentPageState extends BasePageState<IncidentListPage> {
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
    return ref.watch(
      incidentListViewModelProvider.select(
        (state) {
          return state.hasValue && state.value!.isNotEmpty
              ? const IncidentButtonReport()
              : null;
        },
      ),
    );
  }

  @override
  void listener() {
    ref.listen<IncidentOutput?>(
      incidentSelectedProvider,
      (oldItem, currentItem) {
        if (oldItem != null && oldItem != currentItem) {
          debugPrint("Produto alterado com sucesso");
          ref
              .watch(incidentListViewModelProvider.notifier)
              .updateAt(currentItem!);
        }
      },
    );

    super.listener();
  }

  @override
  Widget buildPage(BuildContext context) {
    final state = ref.watch(incidentListViewModelProvider);
    return state.when(
      data: (incidents) => IncidenList(items: incidents),
      loading: () => const IncidentListShimmer(),
      error: (error, stackTrace) => const IncidentEmptyData(),
    );
  }
}
