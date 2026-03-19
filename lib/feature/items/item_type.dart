import 'package:flutter/material.dart';

enum ItemType { none, car, moto, phone }

extension ItemTypeExtension on ItemType {
  String get labelRouberry {
    switch (this) {
      case ItemType.car:
        return 'Carro roubado';
      case ItemType.moto:
        return 'Moto roubada';
      case ItemType.phone:
        return 'Celular roubado';
      case ItemType.none:
        return 'Não informado';
    }
  }

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

  String get assets {
    switch (this) {
      case ItemType.car:
        return "assets/images/car_rouberry_v4.png";
      case ItemType.moto:
        return "assets/images/motorcycle_pin_v9.png";
      case ItemType.phone:
        return "assets/images/phone_pin_v2.png";
      case ItemType.none:
        return '';
    }
  }
}
