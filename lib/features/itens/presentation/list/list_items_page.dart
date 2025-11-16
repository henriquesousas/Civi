import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/domain/item_status.dart';
import 'package:deehelp/features/itens/presentation/list/components/list_item_card.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/theme/constants.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  List<Item> _menuItems = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _menuItems = [
      Item(
        id: '123',
        name: 'Teste',
        code: 'DND0171',
        year: 2010,
        imageUrl:
            'https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev/products/1763224036114.jpeg',
        status: ItemStatus.pending,
        type: 'Carro',
        userId: '123',
      ),
      Item(
        id: '123',
        name: 'Teste',
        code: 'JDEH71',
        year: 2010,
        imageUrl:
            'https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev/products/1763224036114.jpeg',
        status: ItemStatus.active,
        type: 'Caminhao',
        userId: '123',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: FadeSlideTransitionAnimator(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () => context.push(RouterConstant.createNewItem),
                label: Text(R.strings.addNewItem),
                icon: const Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  minimumSize: Size.zero,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: defaultPadding,
                      right: defaultPadding,
                    ),
                    child: ListItemCard(
                      image: item.imageUrl ?? '',
                      brandName: item.name,
                      code: item.code,
                      year: item.year,
                      active: true,
                      press: () => context.push(RouterConstant.itemEdit),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
