import 'package:deehelp/features/profile/components/profile_box_decoration.dart';
import 'package:deehelp/features/profile/components/profile_menu_item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/resources.dart';
import '../../../core/router/router_constants.dart';

class ProfileSharedSupportCard extends StatelessWidget {
  const ProfileSharedSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            R.strings.sharedAndSupport,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          ProfileBoxDecoration(
            child: Column(
              children: [
                ProfileMenuListTile(
                  text: "Avaliar DeeHelp",
                  svgSrc: R.images.svgWishlist,
                  // press: () => context.push(RouterConstant.help),
                  press: () => {},
                ),
                ProfileMenuListTile(
                  text: "Enviar mensagem",
                  svgSrc: R.images.svgHelp,
                  press: () => {},
                ),
                ProfileMenuListTile(
                  text: R.strings.faq,
                  svgSrc: R.images.svgFaq,
                  press: () => context.push(RouterConstant.faq),
                  isShowDivider: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
