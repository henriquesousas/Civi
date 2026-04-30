import 'package:deehelp/v2/core/theme/size_radius.dart';
import 'package:deehelp/v2/core/widgets/ui_indicator.dart';
import 'package:deehelp/v2/core/widgets/ui_thin_divider.dart';
import 'package:deehelp/v2/feature/map/presentation/widgets/bottom_sheet_header.dart';
import 'package:deehelp/v2/feature/map/presentation/widgets/incident_card.dart';
import 'package:deehelp/v2/feature/map/presentation/widgets/incident_item.dart';
import 'package:flutter/material.dart';

class DraggableContent extends StatelessWidget {
  final ScrollController scrollController;
  final List<IncidentItem> incidents;
  const DraggableContent(
      {super.key, required this.scrollController, required this.incidents});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(SizeRadius.m),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 20,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          const SizedBox(height: 5),
          const UIIndicator(),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                // bottom: bottomNavHeight + 20,
              ),
              children: [
                const BottomSheetHeader(),
                const UIThinDivider(),
                ...incidents.map((e) => IncidentCard(item: e)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
