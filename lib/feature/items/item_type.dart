import 'package:flutter/material.dart';

enum ItemType { none, car, moto, phone }

extension ItemTypeExtension on ItemType {
  String get label {
    switch (this) {
      case ItemType.car:
        return 'Carro';
      case ItemType.moto:
        return 'Moto';
      case ItemType.phone:
        return 'Celular';
      case ItemType.none:
        return 'Não informado';
    }
  }

  IconData get icon {
    switch (this) {
      case ItemType.car:
        return Icons.directions_car_outlined;
      case ItemType.moto:
        return Icons.motorcycle;
      case ItemType.phone:
        return Icons.phone_iphone_outlined;
      case ItemType.none:
        return Icons.image;
    }
  }
}
