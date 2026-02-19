import 'package:deehelp/feature/items/item_type.dart';

final vehicleData = [
  'Chevrolet',
  'Citroën',
  'Fiat',
  'Ford',
  'Honda',
  'Hyundai',
  'Jeep',
  'Kia',
  'Nissan',
  'Peugeot',
  'Renault',
  'Toyota',
  'Volkswagen',
  'BMW',
  'BYD',
  'Chery',
  'GWM',
  'JAC',
  'Land Rover',
  'Mercedes-Benz',
  'Mitsubishi',
  'Volvo',
];

final motorcycleData = [
  'Dafra',
  'Haojue',
  'Harley-Davidson',
  'Kawasaki',
  'Royal Enfield',
  'Shineray',
  'Suzuki',
  'Triumph',
  'Yamaha',
  'Honda',
];

final phoneData = [
  'Apple',
  'Samsung',
  'Motorola',
  'Xiaomi',
  'Realme',
  'Asus',
  'LG',
];

List<String> getData(ItemType type) {
  if (type == ItemType.car) return vehicleData;
  if (type == ItemType.moto) return motorcycleData;
  return phoneData;
}
