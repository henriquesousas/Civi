import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';

class ModalSelectBrand extends StatelessWidget {
  final Function(String) onChange;
  const ModalSelectBrand({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> brands = [
      {'name': 'Toyota'},
      {'name': 'Volkswagen'},
      {'name': 'Ford'},
      {'name': 'Honda'},
      {'name': 'Nissan'},
      {'name': 'Nissan'},
      {'name': 'Hyundai'},
      {'name': 'Chevrolet'},
      {'name': 'Chevrolet'},
      {'name': 'Kia'},
      {'name': 'BMW'},
      {'name': 'Audi'},
      {'name': 'Lexus'},
      {'name': 'Volvo'},
      {'name': 'Land Rover'},
      {'name': 'Ford'},
      {'name': 'Chevrolet'},
      {'name': 'Tesla'},
      {'name': 'Jeep'},
      {'name': 'Dodge'},
      {'name': 'BYD'},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          // Container(
          //   margin: const EdgeInsets.only(bottom: 8),
          //   width: 40,
          //   height: 4,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[300],
          //     borderRadius: BorderRadius.circular(2),
          //   ),
          // ),
          Text(R.strings.selectBrand),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey.shade300,
              ),
              itemCount: brands.length,
              itemBuilder: (context, index) {
                final color = brands[index];
                return ListTile(
                  onTap: () {
                    onChange(color["name"].toString());
                    //context.pop();
                  },
                  title: Text(
                    color["name"].toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
