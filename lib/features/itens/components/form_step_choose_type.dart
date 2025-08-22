import 'package:flutter/material.dart';
import 'package:yousafe/features/itens/components/create_item_card.dart';
import 'package:yousafe/features/itens/components/header.dart';

import '../my_item.dart';

class FormStepChooseType extends StatefulWidget {
  const FormStepChooseType({super.key});

  @override
  State<FormStepChooseType> createState() => _FormStepChooseTypeState();
}

class _FormStepChooseTypeState extends State<FormStepChooseType> {
  final List<MyItem> _myItems = [
    MyItem("Moto", Icons.electric_moped, false),
    MyItem("Carro", Icons.drive_eta, false),
    MyItem("Celular", Icons.phone_android, false),
    MyItem("Caminhão", Icons.local_shipping, false),
    MyItem("Bicleta", Icons.directions_bike_outlined, false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            title: "Qual é o seu produto?",
            subtitle:
                "Informe o tipo de produto (carro, moto, celular ou outro). Isso facilita a identificação da sua ocorrência.",
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemCount: _myItems.length,
            itemBuilder: (context, index) {
              final item = _myItems[index];
              return CreateItemCard(
                item: item,
                onTap: () {
                  setState(() {
                    //TODO: Refactor
                    for (var i = 0; i < _myItems.length; i++) {
                      _myItems[i].isSelected = false;
                    }
                    item.changeSelected();
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
