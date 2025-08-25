import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/features/itens/list/my_items_card.dart';
import 'package:yousafe/features/itens/my_items.dart';
import 'package:yousafe/shared/animation/fade_slide_transition_animator.dart';
import 'package:yousafe/shared/components/primary_app_bar.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

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
      MyItems("Golf", "ABC-123", true, 2022, ImageConfig.fakeCarro3),
      MyItems("Iphone", "52463458974563124456", false, 2022, null),
      MyItems("CG Titan 150", "52463458974563124456", false, 2025,
          ImageConfig.fakeMoto1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Meus itens",
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                TextButton(
                  onPressed: () => context.push(Routes.createNewItem),
                  child: Text(
                    "Novo Item",
                    style: context.getTextStyle.small,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: FadeSlideTransitionAnimator(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _menuItems.length,
          itemBuilder: (context, index) {
            final item = _menuItems[index];
            return MyItemsCard(
              item: item,
              onTap: () => context.push(
                Routes.itemEdit,
              ),
            );
          },
        ),
      ),
    );
  }
}
