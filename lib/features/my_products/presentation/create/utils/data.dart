import 'package:deehelp/features/my_products/presentation/create/utils/type_item_select.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';

class Data {
  List<TypeItemSelect> load() {
    return [
      TypeItemSelect(R.strings.listItems[0], Icons.drive_eta, false),
      TypeItemSelect(R.strings.listItems[1], Icons.local_shipping, false),
      TypeItemSelect(R.strings.listItems[2], Icons.motorcycle_outlined, false),
      // TypeItemSelect("Bicleta", Icons.directions_bike_outlined, false),
      // TypeItemSelect("Celular", Icons.phone_android, false),
    ];
  }
}
