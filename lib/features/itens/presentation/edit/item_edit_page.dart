import 'package:deehelp/core/components/container/ui_simple_container.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/list/components/status_badge_widget.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors_v2.dart';
import '../../../../core/components/images/ui_network_image_with_loader.dart';
import '../../../../core/resources/resources.dart';
import '../../../../shared/animation/fade_slide_transition_animator.dart';
import 'item_detail_tile.dart';
import 'item_edit_footer.dart';

class ItemEditPage extends StatefulWidget {
  final Item item;

  const ItemEditPage({super.key, required this.item});

  @override
  State<ItemEditPage> createState() => _ItemEditPageState();
}

class _ItemEditPageState extends State<ItemEditPage> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Scaffold(
      backgroundColor: AppColorsV2.background,
      appBar: UIAppBar(
        title: "Detalhes",
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: StatusBadgeWidget(status: item.status),
          ),
        ],
      ),
      body: FadeSlideTransitionAnimator(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(18),
          child: Column(
            spacing: 10,
            children: [
              UISimpleContainer(
                padding: const EdgeInsets.all(2),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      ItemDetailTile(
                          title: R.strings.brand, subtitle: item.brand),
                      ItemDetailTile(
                          title: R.strings.name, subtitle: item.name),
                      ItemDetailTile(
                          title: R.strings.plate, subtitle: item.code),
                      ItemDetailTile(
                          title: R.strings.color,
                          subtitle: item.color,
                          showDivider: false),
                    ],
                  ),
                ],
              ),
              UISimpleContainer(
                padding: const EdgeInsets.all(2),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      ItemDetailTile(
                          title: R.strings.type,
                          subtitle: item.type,
                          showDivider: false),
                    ],
                  ),
                ],
              ),
              UISimpleContainer(
                padding: const EdgeInsets.all(2),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      ItemDetailTile(
                        title: R.strings.detail,
                        subtitle: item.obs ?? '',
                        showDivider: false,
                      )
                    ],
                  ),
                ],
              ),
              UISimpleContainer(
                padding: const EdgeInsets.all(2),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      ItemDetailTile(
                        title: R.strings.photos,
                        subtitle: "1 ${R.strings.photos}(s)",
                        showDivider: false,
                        showCam: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UINetworkImageWithLoader(
                          src: item.imageUrl ?? "",
                          width: context.percentWidth(0.9),
                          height: context.percentHeight(0.3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ItemEditFooter(
                onConfirm: () {},
                onDelete: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
