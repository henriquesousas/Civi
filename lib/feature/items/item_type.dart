import 'package:flutter/material.dart';

enum ItemType {
  none,
  car,
  moto,
  phone,
  robberyAttempt,
  motorcycleApproach,
  onFootApproach,
  vehicleInvasionAttempt,
  suspiciousActivity
}

extension ItemTypeExtension on ItemType {
  String get labelRouberry {
    switch (this) {
      case ItemType.car:
        return 'Roubo de carro';
      case ItemType.moto:
        return 'Roubo de moto';
      case ItemType.phone:
        return 'Roubo de celular';
      case ItemType.suspiciousActivity:
        return 'Atividade suspeita';
      case ItemType.robberyAttempt:
        return 'Objeto arremessado contra veículo';
      case ItemType.motorcycleApproach:
        return 'Motoqueiro abordando pessoas';
      case ItemType.onFootApproach:
        return 'Suspeito a pé abordando pessoas';
      case ItemType.vehicleInvasionAttempt:
        return 'Suspeito tentando invadir veículo';
      default:
        return 'Ocorrência';
    }
  }

  String get label {
    switch (this) {
      case ItemType.car:
        return 'Carro roubado';
      case ItemType.moto:
        return 'Moto roubada';
      case ItemType.phone:
        return 'Celular roubado';
      case ItemType.robberyAttempt:
        return 'Tentativa de roubo';
      case ItemType.motorcycleApproach:
        return 'Abordagem de moto';
      case ItemType.onFootApproach:
        return 'Abordagem a pé';
      case ItemType.vehicleInvasionAttempt:
        return 'Tentativa de invasão veicular';
      case ItemType.suspiciousActivity:
        return 'Atividade suspeita';
      default:
        return 'Não informado';
    }
  }

  // Color get color {
  //   switch (this) {
  //     // case ItemType.robberyAttempt:
  //     //   return const Color(0xFFFBBF24);
  //     // case ItemType.motorcycleApproach:
  //     //   return const Color(0xFF78A6FF);
  //     // case ItemType.onFootApproach:
  //     //   return const Color(0xFF34D399);
  //     // case ItemType.vehicleInvasionAttempt:
  //     //   return const Color(0xFFA78BFA);
  //     case ItemType.robberyAttempt:
  //       return const Color(0xFFFBBF24);
  //     case ItemType.motorcycleApproach:
  //       return const Color(0xFFFBBF24);
  //     case ItemType.onFootApproach:
  //       return const Color(0xFFFBBF24);
  //     case ItemType.vehicleInvasionAttempt:
  //       return const Color(0xFFFBBF24);

  //     default:
  //       return AppColors.danger;
  //   }
  // }

  IconData get icon {
    switch (this) {
      case ItemType.car:
        return Icons.directions_car_outlined;
      case ItemType.moto:
        return Icons.motorcycle;
      case ItemType.phone:
        return Icons.phone_iphone_outlined;
      case ItemType.robberyAttempt:
        return Icons.car_crash_rounded;
      case ItemType.motorcycleApproach:
        return Icons.two_wheeler_rounded;
      case ItemType.onFootApproach:
        return Icons.directions_walk_rounded;
      case ItemType.vehicleInvasionAttempt:
        return Icons.vpn_key_rounded;
      default:
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
      case ItemType.robberyAttempt:
        // return "assets/images/accident.png";
        return "assets/images/thief.png";
      case ItemType.motorcycleApproach:
        return "assets/images/motorcycle_approach3.png";
      case ItemType.onFootApproach:
        // return "assets/images/on_foot_approachv3.png";
        return "assets/images/boot.png";
      // return "assets/images/thief.png";
      case ItemType.vehicleInvasionAttempt:
        return "assets/images/unlockv2.png";
      case ItemType.suspiciousActivity:
        return "assets/images/thief.png";
      default:
        return "";
    }
  }

  String? get value {
    switch (this) {
      case ItemType.car:
        return 'Carro';
      case ItemType.moto:
        return 'Moto';
      case ItemType.phone:
        return 'Celular';

      default:
        return null;
    }
  }
}
