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
}
