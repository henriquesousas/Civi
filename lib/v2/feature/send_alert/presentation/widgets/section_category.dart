import 'package:deehelp/v2/feature/send_alert/presentation/widgets/category_chip.dart';
import 'package:flutter/material.dart';

class SectionCategory extends StatelessWidget {
  final String? selectedCategory;
  final ValueChanged<String> onSelected;

  const SectionCategory({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      ('🚨', 'Arrastão'),
      ('🚗', 'Ataque a veículos (pontes)'),
      ('🚧', 'Colisão'),
      ('🐾', 'Pet desaparecido'),
      ('🥷', 'Atividade suspeita'),
      ('🚨', 'Roubo'),
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 14,
      children: items
          .map(
            (item) => CategoryChip(
              emoji: item.$1,
              label: item.$2,
              isSelected: selectedCategory == item.$2,
              onTap: () => onSelected(item.$2),
            ),
          )
          .toList(),
    );
  }
}
