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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Text(R.strings.selectBrand),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    final brand = brands[index];
                    return ListTile(
                      onTap: () {
                        onChange(brand["name"].toString());
                      },
                      title: Text(
                        brand["name"].toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
