import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';

class ModalSelectColor extends StatelessWidget {
  final Function(String) onChange;
  const ModalSelectColor({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> colors = [
      {'name': 'Preto', 'hex': '#000000'},
      {'name': 'Vermelho', 'hex': '#FF0000'},
      {'name': 'Branco', 'hex': '#FFFFFF'},
      {'name': 'Cinza', 'hex': '#808080'},
      {'name': 'Prata', 'hex': '#C0C0C0'},
      {'name': 'Verde', 'hex': '#00FF00'},
      {'name': 'Azul', 'hex': '#0000FF'},
      {'name': 'Amarelo', 'hex': '#FFFF00'},
      {'name': 'Roxo', 'hex': '#800080'},
      {'name': 'Laranja', 'hex': '#FFA500'},
      {'name': 'Rosa', 'hex': '#FFC0CB'},
      {'name': 'Marrom', 'hex': '#A52A2A'},
      {'name': 'Ciano', 'hex': '#00FFFF'},
      {'name': 'Magenta', 'hex': '#FF00FF'},
      {'name': 'Verde Lima', 'hex': '#00FF00'},
      {'name': 'Azul Marinho', 'hex': '#000080'},
      {'name': 'Verde Floresta', 'hex': '#228B22'},
      {'name': 'Dourado', 'hex': '#FFD700'},
      {'name': 'Turquesa', 'hex': '#40E0D0'},
      {'name': 'Salmão', 'hex': '#FA8072'},
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            R.strings.selectColor,
          ),
        ),
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            itemCount: colors.length,
            itemBuilder: (context, index) {
              final color = colors[index];
              return ListTile(
                onTap: () {
                  onChange(color["name"].toString());
                },
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(
                        int.parse(color["hex"]!.replaceFirst('#', '0xFF'))),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
                title: Text(color["name"].toString(),
                    style: Theme.of(context).textTheme.titleSmall),
              );
            },
          ),
        ),
      ],
    );
  }
}
