import 'package:deehelp/features/itens/presentation/create/type_item_select.dart';
import 'package:flutter/material.dart';

class Data {
  List<TypeItemSelect> load() {
    return [
      TypeItemSelect("Carro", Icons.drive_eta, false),
      TypeItemSelect("Caminhão", Icons.local_shipping, false),
      TypeItemSelect("Motocicleta", Icons.electric_moped, false),
      TypeItemSelect("Bicleta", Icons.directions_bike_outlined, false),
      TypeItemSelect("Celular", Icons.phone_android, false),
    ];
  }
}
