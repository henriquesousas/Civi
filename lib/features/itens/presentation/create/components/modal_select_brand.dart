import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';

class ModalSelectBrand extends StatelessWidget {
  final List<String> values;
  final Function(String) onChange;
  const ModalSelectBrand({
    super.key,
    required this.onChange,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
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
                  itemCount: values.length,
                  itemBuilder: (context, index) {
                    final value = values[index];
                    return ListTile(
                      onTap: () {
                        onChange(value);
                      },
                      title: Text(
                        value,
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
