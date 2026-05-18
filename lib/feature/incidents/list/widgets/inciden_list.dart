import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/incidents/providers/incident_selected_provider.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/feature/incidents/list/widgets/incident_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IncidenList extends ConsumerWidget {
  final List<IncidentOutput> items;
  const IncidenList({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final it = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: IncidentListItemV2(
            incident: it,
            onPressed: () {
              ref.watch(incidentSelectedProvider.notifier).state = it;
              context.push(IncidentRouter.detail);
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: context.outlineVariantColor,
          height: 1,
        );
      },
    );
    // return ListView(
    //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
    //   children: [
    //     ...items.map(
    //       (it) => Padding(
    //         padding: const EdgeInsets.only(bottom: 12),
    //         child: IncidentListItemV2(
    //           incident: it,
    //           onPressed: () {
    //             ref.watch(incidentSelectedProvider.notifier).state = it;
    //             context.push(IncidentRouter.detail);
    //           },
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
