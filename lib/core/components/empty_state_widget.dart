import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: 120,
              // height: 120,
              decoration: BoxDecoration(
                color: Color(0xFFF8FAFC),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[200]!, width: 1),
              ),
              child: Icon(Icons.inventory_2_outlined,
                  size: 50, color: Colors.grey[400]),
            ),
            // const SizedBox(height: 24),
            Text(
              'Nenhum item encontrado',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            // const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Comece adicionando seu primeiro item à plataforma para gerenciar seus veículos, celulares e outros itens',
                textAlign: TextAlign.center,
              ),
            ),
            // const SizedBox(height: 24),
            SizedBox(
              width: context.percentWidth(0.6),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.add, size: 16),
                label: const Text(
                  'Adicionar',
                  // style: TextStyle(
                  //   fontSize: 12,
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
