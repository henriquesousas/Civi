import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/presentation/list/widgets/incident_empty_data.dart';
import 'package:deehelp/features/incident/presentation/list/widgets/incident_list_item.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IncidenList extends ConsumerWidget {
  final List<IncidentOutput> items;
  const IncidenList({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return items.isNotEmpty
        ? Column(
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
                          return IncidentListItem(
                              incident: incident,
                              isLoading: false,
                              onPressed: () {
                                ref
                                    .watch(incidentSelectedProvider.notifier)
                                    .state = incident;
                                context.push(AppRouter.updateIncident);
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : const IncidentEmptyData();
  }
}
