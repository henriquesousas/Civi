import 'package:deehelp/core/components/buttons/ui_outline_button.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/itens/list/secondary_item_card.dart';
import 'package:deehelp/features/itens/my_items.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/resources.dart';
import '../../../core/theme/constants.dart';

class MyItemsPage extends StatefulWidget {
  const MyItemsPage({super.key});

  @override
  State<MyItemsPage> createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  List<MyItems> _menuItems = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _menuItems = [
      MyItems(
        "Wolkswagen Gol",
        "DND0171",
        true,
        2022,
        "https://atribunarj.com.br/uploads/FILES/destacadas/03-01-2025-Carroroubadoerecuperado.webp",
        true,
      ),
      MyItems(
        "FIAT DUCATO 2.3 - Kleyn Vans",
        "ABC7451",
        true,
        2024,
        "https://d2e5b8shawuel2.cloudfront.net/vehicle/310033/hrv/original.jpg",
        false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: FadeSlideTransitionAnimator(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: UIOutlineButton(
                borderColor: AppColors.lightGreyColor20,
                textColor: AppColors.whileColor10,
                text: R.strings.addNewItem,
                press: () => context.push(RouterConstant.createNewItem),
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
                    child: SecondaryItemCard(
                      image: item.imageUrl ?? '',
                      brandName: item.name,
                      code: item.code,
                      year: item.year,
                      active: item.active,
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
