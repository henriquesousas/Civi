import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/type_card.dart';
import 'package:flutter/material.dart';

class TypeSelector extends StatelessWidget {
  final ItemType? selected;
  final ValueChanged<ItemType> onSelect;

  const TypeSelector({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TypeCard(
          title: 'Carro',
          asset: "assets/images/car_rouberry_v2.png",
          subtitle: 'Veículo de 4 rodas',
          icon: Icons.directions_car_filled_outlined,
          selected: selected == ItemType.car,
          onTap: () => onSelect(ItemType.car),
        ),
        const SizedBox(height: SpacingSize.sm),
        TypeCard(
          title: 'Moto',
          asset: "assets/images/motorcycle_pin_v6.png",
          subtitle: 'Moto, elétrica ou similar',
          icon: Icons.two_wheeler_outlined,
          selected: selected == ItemType.moto,
          onTap: () => onSelect(ItemType.moto),
        ),
        const SizedBox(height: SpacingSize.sm),
        TypeCard(
          title: 'Celular',
          asset: "assets/images/phone_pin_v2.png",
          subtitle: 'Smartphone e aparelhos',
          icon: Icons.smartphone_outlined,
          selected: selected == ItemType.phone,
          onTap: () => onSelect(ItemType.phone),
        ),
      ],
    );
  }
}
