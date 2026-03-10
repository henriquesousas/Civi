import 'package:deehelp/feature/search/widgets/toogle_chip.dart';
import 'package:flutter/material.dart';

enum SearchMode { auto, plate, imei, incidentCode }

class ModeToggle extends StatelessWidget {
  final SearchMode value;
  final ValueChanged<SearchMode> onChanged;

  const ModeToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Row(
        children: [
          Expanded(
            child: ToggleChip(
              selected: value == SearchMode.auto,
              label: 'Auto',
              icon: Icons.manage_search_rounded,
              onTap: () => onChanged(SearchMode.auto),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: ToggleChip(
              selected: value == SearchMode.plate,
              label: 'Placa',
              icon: Icons.confirmation_number_outlined,
              onTap: () => onChanged(SearchMode.plate),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: ToggleChip(
              selected: value == SearchMode.imei,
              label: 'IMEI',
              icon: Icons.dialpad_outlined,
              onTap: () => onChanged(SearchMode.imei),
            ),
          ),
          // const SizedBox(width: 4),
          // Expanded(
          //   child: ToggleChip(
          //     selected: value == SearchMode.incidentCode,
          //     label: 'Código',
          //     icon: Icons.tag_rounded,
          //     onTap: () => onChanged(SearchMode.incidentCode),
          //   ),
          // ),
        ],
      ),
    );
  }
}
